import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RepositorySection extends StatelessWidget {
  const RepositorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              'https://limbuscompany.wiki.gg/images/S918.png',
              width: 160,
              height: 160,
              fit: BoxFit.contain,
              cacheWidth: 320,
              cacheHeight: 320,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                width: 160,
                height: 160,
                child: Icon(Icons.public, size: 120, color: Colors.yellow),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Todos deben jugar limbus company',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: QrImageView(
                data: 'https://github.com/Kilian-Salesianos',
                version: QrVersions.auto,
                size: 200,
                backgroundColor: Colors.yellow,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Colors.black,
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
