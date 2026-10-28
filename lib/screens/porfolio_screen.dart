import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/portfolio_page.dart';

class PorfolioScreen extends StatelessWidget {
  const PorfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Porfolio'), centerTitle: true),
      drawer: const AppDrawer(),
      body: const PortfolioPage(),
    );
  }
}
