import 'package:flutter/material.dart';

void main() {
  runApp(PrimeNumberApp());
}

class PrimeNumberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeNumberScreen(),
    );
  }
}

class PrimeNumberScreen extends StatefulWidget {
  @override
  _PrimeNumberScreenState createState() => _PrimeNumberScreenState();
}

class _PrimeNumberScreenState extends State<PrimeNumberScreen> {
  TextEditingController _numberController = TextEditingController();
  String _result = '';

  bool isPrime(int number) {
    if (number <= 1) return false;

    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  void _checkPrimeNumber() {
    int number = int.tryParse(_numberController.text) ?? 0;

    setState(() {
      if (isPrime(number)) {
        _result = '$number là số nguyên tố';
      } else {
        _result = '$number không là số nguyên tố';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiểm tra số nguyên tố'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhập số'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkPrimeNumber,
              child: Text('Kiểm tra'),
            ),
            SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
