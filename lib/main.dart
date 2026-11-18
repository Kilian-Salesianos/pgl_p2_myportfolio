import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/animal_crud_screen.dart';
import 'screens/home_screen.dart';
import 'screens/porfolio_screen.dart';
import 'screens/user_login_screen.dart';
import 'screens/user_register_screen.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/porfolio',
      builder: (context, state) => const PorfolioScreen(),
    ),
    GoRoute(
      path: '/animales',
      builder: (context, state) => const AnimalCrudScreen(),
    ),
    GoRoute(
      path: '/registro',
      builder: (context, state) => const UserRegisterScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const UserLoginScreen(),
    ),
  ],
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Portfolio',
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
    );
  }
}
