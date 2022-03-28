import 'package:flutter/material.dart';
import 'package:uni_sulamerica/controllers/lista_universidades_controller.dart';
import 'package:uni_sulamerica/models/universidade.dart';

class ListaUniversidadesPage extends StatefulWidget {
  const ListaUniversidadesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ListaUniversidadesPage> createState() => _ListaUniversidadesPageState();
}

class _ListaUniversidadesPageState extends State<ListaUniversidadesPage> {
  final TextEditingController _searchQuery = TextEditingController();
  final controller = ListaUniversidadesController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        final routeData = ModalRoute.of(context)?.settings.arguments as String;
        controller.start(routeData);
      });
    });
  }

  _success() {
    return ListView.builder(
      itemCount: controller.universidades.length,
      itemBuilder: (context, index) {
        UniversidadeModel universidade = controller.universidades[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () => Navigator.pushNamed(
              context,
              '/detalhes_universidade',
              arguments: AtributosUniversidade(universidade.country,
                  universidade.name, universidade.webPages),
            ),
            child: ListTile(
              title: Text(universidade.name ?? "Sem nome"),
              trailing: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ),
          ),
        );
      },
    );
  }

  _error() {
    return const Center(
      child: Text('Erro ao carregar lista de universidades'),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return const Center(
      child: Text('Inicie a busca'),
    );
  }

  stateManager(ListaUniversidadesState state) {
    switch (state) {
      case ListaUniversidadesState.start:
        return _start();
      case ListaUniversidadesState.loading:
        return _loading();
      case ListaUniversidadesState.success:
        return _success();
      case ListaUniversidadesState.error:
        return _error();
      default:
        return _start();
    }
  }

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
              child: AnimatedBuilder(
                animation: controller.state,
                builder: (context, child) {
                  return stateManager(controller.state.value);
                },
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

class AtributosUniversidade {
  final String? pais;
  final String? nome;
  final List<String>? sites;

  AtributosUniversidade(this.pais, this.nome, this.sites);
}
