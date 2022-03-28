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
                        bandeiraUrl: "https://flagcdn.com/w40/ar.png",
                        country: "argentina"),
                    PaisBtn(
                      nome: "Bolívia",
                      bandeiraUrl: "https://flagcdn.com/w40/bo.png",
                      country: "Bolivia, Plurinational State of",
                    ),
                    PaisBtn(
                      nome: "Brasil",
                      bandeiraUrl: "https://flagcdn.com/w40/br.png",
                      country: "brazil",
                    ),
                    PaisBtn(
                      nome: "Chile",
                      bandeiraUrl: "https://flagcdn.com/w40/cl.png",
                      country: "chile",
                    ),
                    PaisBtn(
                      nome: "Colômbia",
                      bandeiraUrl: "https://flagcdn.com/w40/co.png",
                      country: "colombia",
                    ),
                    PaisBtn(
                      nome: "Equador",
                      bandeiraUrl: "https://flagcdn.com/w40/ec.png",
                      country: "ecuador",
                    ),
                    PaisBtn(
                      nome: "Guiana",
                      bandeiraUrl: "https://flagcdn.com/w40/gy.png",
                      country: "guyana",
                    ),
                    PaisBtn(
                      nome: "Paraguai",
                      bandeiraUrl: "https://flagcdn.com/w40/py.png",
                      country: "paraguay",
                    ),
                    PaisBtn(
                      nome: "Peru",
                      bandeiraUrl: "https://flagcdn.com/w40/pe.png",
                      country: "peru",
                    ),
                    PaisBtn(
                      nome: "Suriname",
                      bandeiraUrl: "https://flagcdn.com/w40/sr.png",
                      country: "suriname",
                    ),
                    PaisBtn(
                      nome: "Uruguai",
                      bandeiraUrl: "https://flagcdn.com/w40/uy.png",
                      country: "uruguay",
                    ),
                    PaisBtn(
                      nome: "Venezuela",
                      bandeiraUrl: "https://flagcdn.com/w40/ve.png",
                      country: "Venezuela, Bolivarian Republic of",
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
