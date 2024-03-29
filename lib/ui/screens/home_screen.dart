import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:text_extractor/providers/data_provider.dart';
import 'package:text_extractor/ui/screens/extracted_text_view_screen.dart';
import 'package:text_extractor/ui/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Text Extractor"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomeButton(
                  icon: Icons.camera,
                  buttonName: "Camera",
                  buttonSize: const Size(200, 200),
                  onTap: () {
                    context
                        .read<DataProvider>()
                        .pickImage(source: ImageSource.camera);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExtractedTextViewScreen(),
                        ));
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomeButton(
                  icon: Icons.photo,
                  buttonName: "Gallery",
                  buttonSize: const Size(200, 200),
                  onTap: () {
                    context
                        .read<DataProvider>()
                        .pickImage(source: ImageSource.gallery);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExtractedTextViewScreen(),
                        ));
                  },
                ),
              ],
            ),
          ),
        )
        );
  }
}
