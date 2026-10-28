import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pgl_p2_myportfolio/main.dart';

void main() {
  testWidgets('Drawer navigates between Home and Porfolio', (tester) async {
    await tester.pumpWidget(const MainApp());

    expect(find.text('Canarias Natural'), findsOneWidget);
    expect(find.text('ESCUBRE CANARIAS'), findsOneWidget);
    expect(find.text('Una especie nueva cada día'), findsOneWidget);
    expect(find.text('DESCUBRIR HOY'), findsOneWidget);
    expect(find.text('Explora la biodiversidad\nde las islas'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Porfolio'));
    await tester.pumpAndSettle();

    expect(find.text('Este es mi portfolio modificado'), findsOneWidget);
    expect(find.text('Mis hobbies'), findsOneWidget);
    expect(find.text('Mi repositorio'), findsOneWidget);

    await tester.tap(find.text('Mi repositorio'));
    await tester.pumpAndSettle();
    expect(find.text('Todos deben jugar limbus company'), findsOneWidget);

    await tester.tap(find.text('Mis hobbies'));
    await tester.pumpAndSettle();
    expect(find.text('Leer libros'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    expect(find.text('ESCUBRE CANARIAS'), findsOneWidget);
  });
}
