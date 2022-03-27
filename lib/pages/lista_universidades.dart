import 'package:flutter/material.dart';

class ListaUniversidadesPage extends StatefulWidget {
  const ListaUniversidadesPage({Key? key}) : super(key: key);

  @override
  State<ListaUniversidadesPage> createState() => _ListaUniversidadesPageState();
}

class _ListaUniversidadesPageState extends State<ListaUniversidadesPage> {
  final TextEditingController _searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lista de Universidades',
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {},
                    child: OutlinedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, '/detalhes_universidade'),
                      child: ListTile(
                        leading: const Icon(Icons.school),
                        title: const Text('Universidade 1'),
                        trailing: IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchQuery,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15),
                    suffixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: "Buscar...",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    )),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
