import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_first_app/button_values.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreen();
}

class _CalculatorScreen extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          //output screen
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "0",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          //buttons
          Wrap(
            children: Btn.buttonValues
                .map(
                  (e) => SizedBox(
                      width: e == Btn.n0
                          ? screenSize.width / 2
                          : screenSize.width / 4,
                      height: screenSize.width / 5,
                      child: buildButton(e)),
                )
                .toList(),
          )
        ]),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
          color: getBtnColor(value),
          clipBehavior: Clip.hardEdge,
          shape: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white24),
              borderRadius: BorderRadius.circular(100)),
          child: InkWell(
              onTap: () {},
              child: Center(
                  child: Text(
                value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )))),
    );
  }

  Color getBtnColor(value) {
    return [Btn.del, Btn.clr].contains(value)
        ? Colors.blueGrey
        : [
            Btn.add,
            Btn.subtract,
            Btn.multiply,
            Btn.divide,
            Btn.per,
            Btn.calculate
          ].contains(value)
            ? Colors.orange
            : Colors.black;
  }
}
