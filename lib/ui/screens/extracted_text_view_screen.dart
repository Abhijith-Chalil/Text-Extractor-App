import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:text_extractor/helpers/data_response.dart';
import 'package:text_extractor/providers/data_provider.dart';

class ExtractedTextViewScreen extends StatelessWidget {
  const ExtractedTextViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Extracted Text"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(child: Consumer<DataProvider>(builder: (context, data, _) {
        if (data.extractedText.status == Status.COMPLETED) {
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              data.extractedText.data ?? ""),
          ));
        } else if (data.extractedText.status == Status.LOADING) {
          return  Center(
            child: Lottie.asset("assets/lottie/loading.json"),
          );
        } else {
          return Center(
              child: Lottie.asset('assets/lottie/no_item_found.json'));
        }
      })),
    );
  }
}
