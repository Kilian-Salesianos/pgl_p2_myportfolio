import 'package:flutter/material.dart';

import '../styles/styles.dart';
import 'portfolio_section.dart';

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({super.key, required this.section});

  final PortfolioSection section;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          width: double.infinity,
          color: porfolioHeaderStyle.backgroundColor,
          child: Center(
            child: Text(
              'Este es mi portfolio modificado',
              style: TextStyle(
                fontSize: 20,
                color: porfolioHeaderStyle.foregroundColor,
                fontWeight: porfolioHeaderStyle.fontWeight,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 112,
          width: double.infinity,
          child: Container(
            color: porfolioProfileStyle.backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    section == PortfolioSection.repository
                        ? 'https://decopolis.com/actualidad/wp-content/uploads/2025/07/parque-infantil-scaled.jpg'
                        : 'https://limbuscompany.wiki.gg/images/thumb/E505_2_2.png/320px-E505_2_2.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    cacheWidth: 160,
                    cacheHeight: 160,
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                      width: 80,
                      height: 80,
                      child: Icon(
                        Icons.person,
                        color: porfolioProfileStyle.foregroundColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Soy alumno de 2 de DAM y lo estoy intentando',
                    style: TextStyle(
                      fontSize: 16,
                      color: porfolioProfileStyle.foregroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
