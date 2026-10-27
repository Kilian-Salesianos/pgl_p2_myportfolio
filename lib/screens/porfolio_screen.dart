import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class PorfolioScreen extends StatelessWidget {
  const PorfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Porfolio')),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('El contenido del porfolio se añadirá próximamente.'),
      ),
    );
  }
}
