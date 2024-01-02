import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  double x = 0;
  double y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onPause: _onPause,
      onInactive: _onInactive,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
    );
  }

  void _onShow() => print("onShow called");
  void _onHide() => print("onHide called");
  void _onResume() => print("onResume called");
  void _onDetach() => print("onDetach called");
  void _onPause() => print("onPause called");
  void _onInactive() => print("onInactive called");
  void _onRestart() => print("onRestart called");
  void _onStateChange(AppLifecycleState state) =>
      print("onStateChange called with state: $state");

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const Text(
            "CALCULATOR",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 70,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          // Calculator Display
          DisplayBox(
              key: const Key("DisplayOne"),
              hint: "Enter First Number",
              controller: displayOneController),
          const SizedBox(
            height: 30,
          ),
          DisplayBox(
              key: const Key("DisplayTwo"),
              hint: "Enter Second Number",
              controller: displayTwoController),
          const SizedBox(
            height: 30,
          ),
          Text(
            key: const Key("Result"),
            z.toString(),
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! +
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! -
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! *
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(Icons.close),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! /
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
              FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      x = 0;
                      y = 0;
                      z = 0;
                      displayOneController.clear();
                      displayTwoController.clear();
                    });
                  },
                  label: const Text("Clear"))
            ],
          )
          // Expand
          // Calculator Buttons
        ],
      ),
    );
  }
}

class DisplayBox extends StatelessWidget {
  const DisplayBox({
    super.key,
    this.hint = "Enter a number",
    required this.controller,
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white,
          )),
    );
  }
}
