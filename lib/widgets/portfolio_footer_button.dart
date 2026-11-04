import 'package:flutter/material.dart';

import '../styles/styles.dart';

class PortfolioFooterButton extends StatelessWidget {
  const PortfolioFooterButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.selected = true,
  });

  final String label;
  final VoidCallback onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: selected
              ? porfolioNavigationSelectedStyle.backgroundColor
              : porfolioNavigationUnselectedStyle.backgroundColor,
          foregroundColor: selected
              ? porfolioNavigationSelectedStyle.foregroundColor
              : porfolioNavigationUnselectedStyle.foregroundColor,
          side: BorderSide(
            color: selected
                ? porfolioNavigationSelectedStyle.borderColor
                : porfolioNavigationUnselectedStyle.borderColor,
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
