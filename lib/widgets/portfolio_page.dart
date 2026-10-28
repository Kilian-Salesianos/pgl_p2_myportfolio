import 'package:flutter/material.dart';

import 'hobbies_section.dart';
import 'portfolio_header.dart';
import 'portfolio_navigation_bar.dart';
import 'portfolio_section.dart';
import 'repository_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  PortfolioSection _selectedSection = PortfolioSection.hobbies;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          PortfolioHeader(section: _selectedSection),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: switch (_selectedSection) {
                  PortfolioSection.hobbies => const HobbiesSection(
                    key: ValueKey(PortfolioSection.hobbies),
                  ),
                  PortfolioSection.repository => const RepositorySection(
                    key: ValueKey(PortfolioSection.repository),
                  ),
                },
              ),
            ),
          ),
          PortfolioNavigationBar(
            selectedSection: _selectedSection,
            onSectionSelected: (section) {
              setState(() => _selectedSection = section);
            },
          ),
        ],
      ),
    );
  }
}
