import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Canarias Natural'),
        centerTitle: true,
        backgroundColor: headerStyle.backgroundColor,
        foregroundColor: headerStyle.foregroundColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: headerStyle.foregroundColor,
          fontWeight: headerStyle.fontWeight,
        ),
      ),
      drawer: const AppDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('lib/images/background-image.jpg', fit: BoxFit.cover),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'DESCUBRE CANARIAS',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Una especie nueva cada día',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 18,
                      ),
                    ),
                    child: const Text('DESCUBRIR HOY'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          color: footerStyle.backgroundColor,
          child: Text(
            'Explora la biodiversidad\nde las islas',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: footerStyle.foregroundColor,
              fontWeight: footerStyle.fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
