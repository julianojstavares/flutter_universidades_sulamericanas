import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(
              "https://static.mundoeducacao.uol.com.br/mundoeducacao/2022/01/mapa-america-sul.jpg",
              fit: BoxFit.fill,
              color: Colors.white.withOpacity(0.2),
              colorBlendMode: BlendMode.modulate,
              errorBuilder: (context, url, error) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Atenção: sem conexão com a internet"),
                    ),
                  ],
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Universidades da América do Sul",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              ElevatedButton(
                child: const Text('Lista de Países'),
                onPressed: () => Navigator.pushNamed(context, '/lista_paises'),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
