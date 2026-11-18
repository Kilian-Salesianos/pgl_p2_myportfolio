import 'package:flutter/material.dart';

import '../styles/styles.dart';
import 'portfolio_footer_button.dart';

const _animalCategories = [
  'Mamífero',
  'Ave',
  'Reptil',
  'Pez',
  'Coleópteros',
  'Moluscos',
  'Arácnidos',
  'Lepidópteros',
];

String _categoryImagePath(String category) => switch (category) {
  'Mamífero' => 'lib/images/imagen-mamifero.jpg',
  'Ave' => 'lib/images/imagen-ave.jpg',
  'Reptil' => 'lib/images/imagen-reptil.jpg',
  'Pez' => 'lib/images/imagen-pez.jpg',
  'Coleópteros' => 'lib/images/imagen-coleoptero.jpg',
  'Moluscos' => 'lib/images/imagen-molusco.jpg',
  'Arácnidos' => 'lib/images/imagen-aracnido.jpg',
  'Lepidópteros' => 'lib/images/imagen-lepidoptero.jpg',
  _ => throw ArgumentError.value(category, 'category', 'Categoría desconocida'),
};

class AnimalsContent extends StatefulWidget {
  const AnimalsContent({super.key, required this.onAnimalCountChanged});

  final ValueChanged<int> onAnimalCountChanged;

  @override
  State<AnimalsContent> createState() => _AnimalsContentState();
}

class _AnimalsContentState extends State<AnimalsContent> {
  final List<_Animal> _animals = [];

  Future<void> _addAnimal() async {
    final animal = await showDialog<_Animal>(
      context: context,
      builder: (context) => const _AnimalDialog(),
    );

    if (animal != null && mounted) {
      setState(() => _animals.add(animal));
      widget.onAnimalCountChanged(_animals.length);
    }
  }

  void _deleteAnimal(_Animal animal) {
    setState(() => _animals.remove(animal));
    widget.onAnimalCountChanged(_animals.length);
  }

  Future<void> _deleteAllAnimals() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Borrar todos los animales'),
        content: const Text(
          '¿Seguro que quieres borrar todos los animales de la lista?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Borrar todos'),
          ),
        ],
      ),
    );

    if (shouldDelete == true && mounted) {
      setState(_animals.clear);
      widget.onAnimalCountChanged(_animals.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _animals.isEmpty
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
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            _categoryImagePath(animal.category),
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(animal.name),
                        subtitle: Text(animal.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Chip(label: Text(animal.category)),
                            IconButton(
                              tooltip: 'Borrar ${animal.name}',
                              onPressed: () => _deleteAnimal(animal),
                              icon: const Icon(Icons.delete_outline),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        SafeArea(
          top: false,
          child: Container(
            height: 72,
            width: double.infinity,
            color: porfolioFooterStyle.backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: PortfolioFooterButton(
                    label: 'Añadir',
                    onPressed: _addAnimal,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PortfolioFooterButton(
                    label: 'Borrar',
                    onPressed: _deleteAllAnimals,
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
                initialValue: _selectedCategory,
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