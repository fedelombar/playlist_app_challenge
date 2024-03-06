import 'package:flutter/material.dart';

class SaveButtonWidget extends StatelessWidget {
  final VoidCallback onSaveOrder;

  const SaveButtonWidget({Key? key, required this.onSaveOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Center(
        child: InkWell(
          onTap: onSaveOrder,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Colors.deepPurple, Colors.purple],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
