import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pgl_p2_myportfolio/main.dart';

void main() {
  testWidgets('Drawer navigates between Home and Porfolio', (tester) async {
    await tester.pumpWidget(const MainApp());

    expect(find.text('Bienvenido a mi portfolio'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Porfolio'));
    await tester.pumpAndSettle();

    expect(
      find.text('El contenido del porfolio se añadirá próximamente.'),
      findsOneWidget,
    );

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    expect(find.text('Bienvenido a mi portfolio'), findsOneWidget);
  });
}
