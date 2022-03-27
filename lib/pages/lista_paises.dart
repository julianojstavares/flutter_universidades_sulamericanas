import 'package:flutter/material.dart';
import 'package:uni_sulamerica/widgets/pais_btn.dart';

class ListaPaisesPage extends StatelessWidget {
  const ListaPaisesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Lista de Países',
            ),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Bandeira"),
                    Text("Nome"),
                    Text("Nº Universidades"),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: const [
                    PaisBtn(
                        nome: "Argentina",
                        bandeiraUrl: "https://flagcdn.com/w40/ar.png"),
                    PaisBtn(
                        nome: "Bolívia",
                        bandeiraUrl: "https://flagcdn.com/w40/bo.png"),
                    PaisBtn(
                        nome: "Brasil",
                        bandeiraUrl: "https://flagcdn.com/w40/br.png"),
                    PaisBtn(
                        nome: "Chile",
                        bandeiraUrl: "https://flagcdn.com/w40/cl.png"),
                    PaisBtn(
                        nome: "Colômbia",
                        bandeiraUrl: "https://flagcdn.com/w40/co.png"),
                    PaisBtn(
                        nome: "Equador",
                        bandeiraUrl: "https://flagcdn.com/w40/ec.png"),
                    PaisBtn(
                        nome: "Guiana",
                        bandeiraUrl: "https://flagcdn.com/w40/gy.png"),
                    PaisBtn(
                        nome: "Paraguai",
                        bandeiraUrl: "https://flagcdn.com/w40/py.png"),
                    PaisBtn(
                        nome: "Peru",
                        bandeiraUrl: "https://flagcdn.com/w40/pe.png"),
                    PaisBtn(
                        nome: "Suriname",
                        bandeiraUrl: "https://flagcdn.com/w40/sr.png"),
                    PaisBtn(
                        nome: "Uruguai",
                        bandeiraUrl: "https://flagcdn.com/w40/uy.png"),
                    PaisBtn(
                        nome: "Venezuela",
                        bandeiraUrl: "https://flagcdn.com/w40/ve.png"),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
