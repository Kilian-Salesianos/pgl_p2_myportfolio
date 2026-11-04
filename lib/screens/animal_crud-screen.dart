import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

const _animalCategories = [
  'Mamífero',
  'Ave',
  'Reptil',
  'Anfibio',
  'Pez',
  'Invertebrado',
];

class AnimalCrudScreen extends StatefulWidget {
  const AnimalCrudScreen({super.key});

  @override
  State<AnimalCrudScreen> createState() => _AnimalCrudScreenState();
}

class _AnimalCrudScreenState extends State<AnimalCrudScreen> {
  final List<_Animal> _animals = [];

  Future<void> _addAnimal() async {
    final animal = await showDialog<_Animal>(
      context: context,
      builder: (context) => const _AnimalDialog(),
    );

    if (animal != null && mounted) {
      setState(() => _animals.add(animal));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animales'), centerTitle: true),
      drawer: const AppDrawer(),
      body: _animals.isEmpty
          ? const Center(
              child: Text('Todavía no hay animales. Añade el primero.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _animals.length,
              itemBuilder: (context, index) {
                final animal = _animals[index];
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.pets)),
                    title: Text(animal.name),
                    subtitle: Text(animal.description),
                    trailing: Chip(label: Text(animal.category)),
                  ),
                );
              },
            ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(onPressed: _addAnimal, child: const Text('Añadir')),
              OutlinedButton(onPressed: () {}, child: const Text('Borrar')),
            ],
          ),
        ),
      ),
    );
  }
}

class _Animal {
  const _Animal({
    required this.name,
    required this.description,
    required this.category,
  });

  final String name;
  final String description;
  final String category;
}

class _AnimalDialog extends StatefulWidget {
  const _AnimalDialog();

  @override
  State<_AnimalDialog> createState() => _AnimalDialogState();
}

class _AnimalDialogState extends State<_AnimalDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveAnimal() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).pop(
      _Animal(
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim(),
        category: _selectedCategory!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Añadir animal'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                textCapitalization: TextCapitalization.words,
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Escribe un nombre'
                    : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción breve',
                ),
                maxLength: 120,
                maxLines: 2,
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Escribe una descripción'
                    : null,
              ),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(labelText: 'Categoría'),
                items: _animalCategories
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ),
                    )
                    .toList(),
                onChanged: (category) {
                  setState(() => _selectedCategory = category);
                },
                validator: (value) =>
                    value == null ? 'Selecciona una categoría' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        FilledButton(onPressed: _saveAnimal, child: const Text('Añadir')),
      ],
    );
  }
}
