import 'package:flutter/material.dart';
import 'package:uni_sulamerica/pages/lista_universidades.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalhesUniversidadesPage extends StatelessWidget {
  const DetalhesUniversidadesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)?.settings.arguments as AtributosUniversidade;
    const url = 'http://www.uvs.edu/';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detalhes da Universidade',
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('País: '),
                    Text(routeData.pais ?? 'Não informado'),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Nome: '),
                    Flexible(
                      child: Text(routeData.nome ?? 'Não informado'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: routeData.sites?.length,
                itemBuilder: (context, index) {
                  final site = routeData.sites?[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Site: '),
                          TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () async => openBrowserURL(
                                url: site ?? 'não informado', inApp: true),
                            child: Text(site ?? 'não informado'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.favorite_border),
        ),
      ),
    );
  }

  Future openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }
}
