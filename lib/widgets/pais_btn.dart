import 'package:flutter/material.dart';

class PaisBtn extends StatelessWidget {
  final String nome;
  final String bandeiraUrl;
  final int nUniversidades;
  final String country;

  const PaisBtn({
    Key? key,
    required this.nome, // non-nullable and required
    this.bandeiraUrl = "", // non-nullable but optional with a default value
    this.nUniversidades = 0,
    required this.country // non-nullable but optional with a default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
        ),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.1,
                    ),
                  ),
                  child: Image.network(
                    bandeiraUrl,
                    fit: BoxFit.fill,
                    errorBuilder: ((context, error, stackTrace) =>
                        const Icon(Icons.flag)),
                  ),
                ),
                title: Text(nome),
                trailing: Text(nUniversidades.toString()),
              ),
            ],
          ),
        ),
        onPressed: () => Navigator.pushNamed(context, '/lista_universidades',
            arguments: country),
      ),
    );
  }
}
