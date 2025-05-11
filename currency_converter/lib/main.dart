import 'package:currency_converter/currency_converter_cupertino_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/currency_converter_material_page.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() {
  runApp(const MyCupertinoApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(home: CurrencyConverterMaterialPage());
    return const MaterialApp(home: CurrencyConverterMaterialPageWithState());
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(home: CurrencyConverterCupertinoPage());
  }
}
