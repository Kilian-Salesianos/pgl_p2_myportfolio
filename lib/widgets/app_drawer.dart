import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Navegación', style: TextStyle(fontSize: 24)),
            ),
          ),
          _DrawerItem(
            icon: Icons.home_outlined,
            label: 'Home',
            location: '/',
            selected: currentLocation == '/',
          ),
          _DrawerItem(
            icon: Icons.work_outline,
            label: 'Porfolio',
            location: '/porfolio',
            selected: currentLocation == '/porfolio',
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.location,
    required this.selected,
  });

  final IconData icon;
  final String label;
  final String location;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      selected: selected,
      onTap: () => context.go(location),
    );
  }
}
