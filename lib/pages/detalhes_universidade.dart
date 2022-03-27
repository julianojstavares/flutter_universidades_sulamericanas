import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalhesUniversidadesPage extends StatelessWidget {
  const DetalhesUniversidadesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                  children: const [
                    Text('País: '),
                    Text('Suriname'),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text('Nome: '),
                    Text('Anton de Kom University'),
                  ],
                ),
              ),
            ),
            Card(
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
                      onPressed: () async => openBrowserURL(url: url, inApp: true),
                      child: const Text(url),
                    ),
                  ],
                ),
              ),
            ),
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
