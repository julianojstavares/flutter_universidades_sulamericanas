import 'package:dio/dio.dart';
import 'package:uni_sulamerica/models/universidade.dart';

class UniversidadeRepository {
  final dio = Dio();
  final url = 'http://universities.hipolabs.com/search?country=';

  Future<List<UniversidadeModel>> getUniversidades(String pais) async {
    final response = await dio.get(url + pais);
    final list = response.data as List;
    List<UniversidadeModel> universidades = [];
    for (var item in list) {
      //verifica se já existe um item com o mesmo nome
      if (!universidades.any((element) => element.name == item['name'])) {
        universidades.add(UniversidadeModel.fromJson(item));
      }
    }
    return universidades;
  }
}
