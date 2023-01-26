import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

var userInput = '';
var answer = '0';

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                userInput.toString(),
                style: kCalculationTextStyle,
              ),
              const SizedBox(height: 30),
              Text(
                answer.toString(),
                style: kCalculationTextStyle,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    buttonName: "AC",
                    onPress: () {
                      userInput = '';
                      setState(() {});
                    },
                  ),
                  Button(
                    buttonName: "( )",
                    onPress: () {
                      userInput += '()';
                      setState(() {});
                    },
                  ),
                  Button(
                    buttonName: "%",
                    onPress: () {
                      userInput += '%';
                      setState(() {});
                    },
                  ),
                  Button(
                    color: const Color(0xffffa00a),
                    buttonName: "/",
                    onPress: () {
                      userInput += '/';
                      setState(() {});
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    buttonName: "7",
                    onPress: () {
                      userInput += '7';
                      setState(() {});
                    },
                  ),
                  Button(
                    buttonName: "8",
                    onPress: () {
                      userInput += '8';
                      setState(() {});
                    },
                  ),
                  Button(
                    buttonName: "9",
                    onPress: () {
                      userInput += '9';
                      setState(() {});
                    },
                  ),
                  Button(
                    color: const Color(0xffffa00a),
                    buttonName: "x",
                    onPress: () {
                      userInput += 'x';
                      setState(() {});
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    buttonName: "4",
                    onPress: () {
                      userInput += '4';
                      setState(() {});
                    },
                  ),
                  Button(
                    buttonName: "5",
                    onPress: () {
                      userInput += '5';
                      setState(() {});
                    },
                  ),
                  Button(
                    buttonName: "6",
                    onPress: () {
                      userInput += '6';
                      setState(() {});
                    },
                  ),
                  Button(
                    color: const Color(0xffffa00a),
                    buttonName: "-",
                    onPress: () {
                      userInput += '-';
                      setState(() {});
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    buttonName: "1",
                    onPress: () {
                      userInput += '1';
                      setState(() {});
                    },
                  ),
                  Button(
                    buttonName: "2",
                    onPress: () {
                      userInput += '2';
                      setState(() {});
                    },
                  ),
                  Button(
                    buttonName: "3",
                    onPress: () {
                      userInput += '3';
                      setState(() {});
                    },
                  ),
                  Button(
                    color: const Color(0xffffa00a),
                    buttonName: "+",
                    onPress: () {
                      userInput += '+';
                      setState(() {});
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    buttonName: "0",
                    onPress: () {
                      userInput += '0';
                      setState(() {});
                    },
                  ),
                  Button(
                    buttonName: ".",
                    onPress: () {
                      userInput += '.';
                      setState(() {});
                    },
                  ),
                  Button(
                    buttonName: "DEL",
                    onPress: () {
                      userInput = userInput.substring(0,userInput.length-1);
                      setState(() {});
                    },
                  ),
                  Button(
                    color: const Color(0xffffa00a),
                    buttonName: "=",
                    onPress: () {
                      equalPress();
                      setState(() {});
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }



  void equalPress(){
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double evale = expression.evaluate(EvaluationType.REAL, ContextModel());
    answer = evale.toString();
  }

}






class Button extends StatelessWidget {
  final Color color;
  final String buttonName;
  final VoidCallback onPress;

  const Button({
    Key? key,
    this.color = const Color(0xffa5a5a5),
    required this.buttonName,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: CircleAvatar(
        maxRadius: 30,
        backgroundColor: color,
        child: Text(
          buttonName,
          style: kCalculationTextStyle,
        ),
      ),
    );
  }
}



