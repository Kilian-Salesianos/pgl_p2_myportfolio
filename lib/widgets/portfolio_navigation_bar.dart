import 'package:flutter/material.dart';

import 'portfolio_section.dart';

class PortfolioNavigationBar extends StatelessWidget {
  const PortfolioNavigationBar({
    super.key,
    required this.selectedSection,
    required this.onSectionSelected,
  });

  final PortfolioSection selectedSection;
  final ValueChanged<PortfolioSection> onSectionSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,
      color: Colors.deepPurple,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 48,
              child: _SectionButton(
                label: 'Mis hobbies',
                selected: selectedSection == PortfolioSection.hobbies,
                onPressed: () => onSectionSelected(PortfolioSection.hobbies),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 48,
              child: _SectionButton(
                label: 'Mi repositorio',
                selected: selectedSection == PortfolioSection.repository,
                onPressed: () => onSectionSelected(PortfolioSection.repository),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionButton extends StatelessWidget {
  const _SectionButton({
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: selected ? Colors.yellow : Colors.deepPurple,
        foregroundColor: selected ? Colors.black : Colors.yellow,
        side: const BorderSide(color: Colors.yellow),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
