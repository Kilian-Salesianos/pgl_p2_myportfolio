import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../styles/styles.dart';

class RepositorySection extends StatelessWidget {
  const RepositorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: porfolioRepositoryStyle.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              'lib/images/004_Rokiki.png',
              width: 160,
              height: 160,
              fit: BoxFit.contain,
              cacheWidth: 320,
              cacheHeight: 320,
              errorBuilder: (context, error, stackTrace) => SizedBox(
                width: 160,
                height: 160,
                child: Icon(
                  Icons.public,
                  size: 120,
                  color: porfolioRepositoryStyle.accentColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Todos deben jugar limbus company',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: porfolioRepositoryStyle.foregroundColor,
                fontWeight: porfolioRepositoryStyle.fontWeight,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: porfolioRepositoryStyle.accentColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: QrImageView(
                data: 'https://github.com/Kilian-Salesianos',
                version: QrVersions.auto,
                size: 200,
                backgroundColor: porfolioRepositoryStyle.accentColor,
                eyeStyle: QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: porfolioRepositoryStyle.qrColor,
                ),
                dataModuleStyle: QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: porfolioRepositoryStyle.qrColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
