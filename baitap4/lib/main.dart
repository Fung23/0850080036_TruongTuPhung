import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController _numAController = TextEditingController();
  TextEditingController _numBController = TextEditingController();
  double _result = 0;

  void _calculateResult(String operator) {
    double numA = double.tryParse(_numAController.text) ?? 0;
    double numB = double.tryParse(_numBController.text) ?? 0;
    double result;

    switch (operator) {
      case '+':
        result = numA + numB;
        break;
      case '-':
        result = numA - numB;
        break;
      case '*':
        result = numA * numB;
        break;
      case '/':
        result = numA / numB;
        break;
      default:
        result = 0;
    }

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _numAController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Nhập số a'),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _numBController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Nhập số b'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculateResult('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateResult('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateResult('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateResult('/'),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Kết quả: $_result'),
          ],
        ),
      ),
    );
  }
}
