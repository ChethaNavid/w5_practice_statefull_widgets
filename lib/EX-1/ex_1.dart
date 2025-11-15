import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          children: [
            CustomButton(),
            SizedBox(height: 5),
            CustomButton(),
            SizedBox(height: 5),
            CustomButton(),
            SizedBox(height: 5),
            CustomButton(),
          ],
        ),
      ),
    ),
  ),
);

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  bool isSelected = false;

  String get text => isSelected ? "Selected" : "Not Selected";
  Color get color => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void toggle() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: color,
          backgroundColor: backgroundColor,
        ),
        onPressed: toggle,
        child: Center(child: Text(text)),
      ),
    );
  }
}
