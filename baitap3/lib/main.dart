import 'package:flutter/material.dart';

class ColorChangeButton extends StatefulWidget {
  @override
  _ColorChangeButtonState createState() => _ColorChangeButtonState();
}

class _ColorChangeButtonState extends State<ColorChangeButton> {
  final List<Color> _backgroundColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
  ];
  int _currentColorIndex = 0;

  void _changeBackgroundColor() {
    setState(() {
      // Thay đổi màu nền khi người dùng nhấn nút
      _currentColorIndex = (_currentColorIndex + 1) % _backgroundColors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thay đổi background'),
      ),
      backgroundColor: _backgroundColors[_currentColorIndex], // Áp dụng màu nền đã thay đổi
      body: Center(
        child: ElevatedButton(
          onPressed: _changeBackgroundColor, // Gọi hàm khi người dùng nhấn nút
          child: Text('Nhấn để thay đổi màu nền'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ColorChangeButton(),
  ));
}