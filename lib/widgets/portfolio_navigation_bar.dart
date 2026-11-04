import 'package:flutter/material.dart';

import '../styles/styles.dart';
import 'portfolio_footer_button.dart';
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
      color: porfolioFooterStyle.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: PortfolioFooterButton(
              label: 'Mis hobbies',
              selected: selectedSection == PortfolioSection.hobbies,
              onPressed: () => onSectionSelected(PortfolioSection.hobbies),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: PortfolioFooterButton(
              label: 'Mi repositorio',
              selected: selectedSection == PortfolioSection.repository,
              onPressed: () => onSectionSelected(PortfolioSection.repository),
            ),
          ),
        ],
      ),
    );
  }
}
