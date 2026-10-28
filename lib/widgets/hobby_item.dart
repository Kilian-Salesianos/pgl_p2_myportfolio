import 'package:flutter/material.dart';

class HobbyItem extends StatelessWidget {
  const HobbyItem({super.key, required this.hobbyName});

  final String hobbyName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              hobbyName,
              style: const TextStyle(color: Colors.yellow, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
