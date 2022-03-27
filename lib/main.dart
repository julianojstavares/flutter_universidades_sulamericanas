import 'package:flutter/material.dart';
import 'package:uni_sulamerica/pages/home.dart';
import 'package:uni_sulamerica/widgets/dismiss_keyboard.dart';

import 'pages/detalhes_universidade.dart';
import 'pages/lista_paises.dart';
import 'pages/lista_universidades.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Universidades da América do Sul',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/lista_paises': (context) => const ListaPaisesPage(),
          '/lista_universidades': (context) => const ListaUniversidadesPage(),
          '/detalhes_universidade': (context) =>
              const DetalhesUniversidadesPage(),
        },
      ),
    );
  }
}
