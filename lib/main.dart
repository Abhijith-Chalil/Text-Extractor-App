import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_extractor/providers/data_provider.dart';
import 'package:text_extractor/ui/screens/home_screen.dart';

void main() {
  runApp(const TextExtractor());
}

class TextExtractor extends StatelessWidget {
  const TextExtractor({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'Text Extractor',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
