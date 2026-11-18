import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../widgets/animals_content.dart';
import '../widgets/app_drawer.dart';

class AnimalCrudScreen extends StatefulWidget {
  const AnimalCrudScreen({super.key});

  @override
  State<AnimalCrudScreen> createState() => _AnimalCrudScreenState();
}

class _AnimalCrudScreenState extends State<AnimalCrudScreen> {
  int _animalCount = 0;

  void _updateAnimalCount(int count) {
    setState(() => _animalCount = count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animales Totales: $_animalCount'),
        centerTitle: true,
        backgroundColor: porfolioHeaderStyle.backgroundColor,
        foregroundColor: porfolioHeaderStyle.foregroundColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: porfolioHeaderStyle.foregroundColor,
          fontWeight: porfolioHeaderStyle.fontWeight,
        ),
      ),
      drawer: const AppDrawer(),
      body: AnimalsContent(onAnimalCountChanged: _updateAnimalCount),
    );
  }
}
