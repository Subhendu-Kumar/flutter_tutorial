import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Currency Converter",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
                placeholder: "Enter amount in USD",
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(CupertinoIcons.money_dollar),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton.filled(
                child: const Text("Convert", style: TextStyle(fontSize: 18)),
                onPressed: () {
                  setState(() {
                    result =
                        double.tryParse(textEditingController.text) != null
                            ? double.parse(textEditingController.text) * 82.0
                            : 0.0;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
