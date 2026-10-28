import 'package:flutter/material.dart';

import 'hobby_item.dart';

const List<String> hobbies = [
  'Leer libros',
  'La lluvia',
  'Rpg por turnos',
  'Música vocaloid',
  'Senderismo',
  'Anime/Manga (lee jojos)',
  'Ir a la playa',
  'Ducharme',
  'Los videojuegos',
  'Ir de cenita romántica',
  'Dormir',
  'Viajar',
];

class HobbiesSection extends StatelessWidget {
  const HobbiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: hobbies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 58,
          mainAxisSpacing: 10,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) => HobbyItem(hobbyName: hobbies[index]),
      ),
    );
  }
}
