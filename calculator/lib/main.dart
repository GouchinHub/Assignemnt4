import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;

  Widget numberbutton(String buttonText, Color buttonColor, Color textColor) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            calculation(buttonText);
          },
          child: Text(
            '$buttonText',
            style: TextStyle(fontSize: 35, color: textColor),
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary: buttonColor,
            padding: EdgeInsets.all(30),
          )),
    );
  }

  Widget calcbutton(String buttonText, Color buttonColor, Color textColor) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            calculation(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 35, color: textColor),
          ),
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculator',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 50)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 600.0,
              height: 150.0,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '$text',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 70),
                      ),
                    )
                  ],
                ),
                borderOnForeground: true,
                color: Colors.pink.shade50,
                shadowColor: Colors.pink.shade50,
                elevation: 20,
                margin: EdgeInsets.only(left: 50, right: 150),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                numberbutton('1', Colors.grey.shade800, Colors.pink.shade200),
                numberbutton('2', Colors.grey.shade800, Colors.pink.shade200),
                numberbutton('3', Colors.grey.shade800, Colors.pink.shade200),
                calcbutton('+', Colors.pink.shade200, Colors.black)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                numberbutton('4', Colors.grey.shade800, Colors.pink.shade200),
                numberbutton('5', Colors.grey.shade800, Colors.pink.shade200),
                numberbutton('6', Colors.grey.shade800, Colors.pink.shade200),
                calcbutton('-', Colors.pink.shade200, Colors.black)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                numberbutton('7', Colors.grey.shade800, Colors.pink.shade200),
                numberbutton('8', Colors.grey.shade800, Colors.pink.shade200),
                numberbutton('9', Colors.grey.shade800, Colors.pink.shade200),
                SizedBox(
                  width: 60,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 65,
                ),
                numberbutton('C', Colors.pink.shade500, Colors.black),
                SizedBox(
                  width: 65,
                ),
                calcbutton('=', Colors.pink.shade500, Colors.black)
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  //calculator functions

  int number1 = 0;
  int number2 = 0;
  dynamic text = '';
  dynamic state = false;
  dynamic result = '';
  dynamic oper = '';

  void calculation(buttonText) {
    String add() {
      result += (number1 + number2).toString();
      return result;
    }

    String subtract() {
      result += (number1 - number2).toString();
      return result;
    }

    void clear() {
      text = '0';
      number1 = 0;
      number2 = 0;
      state = 'hold';
      result = '';
      oper = '';
    }

    if (state == 'complete') {
      clear();
    }

    if (buttonText == 'C') {
      clear();
    } else if (buttonText == '+' || buttonText == '-') {
      if (oper == '' && result != '') {
        oper = buttonText;
        result += buttonText;
      } else {
        oper = buttonText;
      }
    } else if (buttonText == '=' && state == 'ready') {
      result += '=';
      if (oper == '+') {
        result = add();
        oper = '';
      } else if (oper == '-') {
        result = subtract();
        oper = '';
      }
      state = 'complete';
    } else {
      if (oper == '' || state == 'ready') {
        number1 = int.parse(buttonText);
        result = number1.toString();
        state = 'hold';
        oper = '';
      } else {
        number2 = int.parse(buttonText);
        result += number2.toString();
        state = 'ready';
      }
    }
    setState(() {
      text = result;
    });
  }
}
