import 'package:flutter/material.dart';

import '../styles/styles.dart';

class HobbyItem extends StatelessWidget {
  const HobbyItem({super.key, required this.hobbyName});

  final String hobbyName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: porfolioHobbyStyle.backgroundColor,
        border: Border.all(color: porfolioHobbyStyle.borderColor, width: 2),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              hobbyName,
              style: TextStyle(
                color: porfolioHobbyStyle.foregroundColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
