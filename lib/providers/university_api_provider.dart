// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:uni_sulamerica/models/universidade.dart';
import 'db_provider.dart';

class UniversityApiProvider {
  final Dio dio;
  UniversityApiProvider(this.dio);

  List<UniversidadeModel> universidades = [];

  final int nUsers = 30;

  Future<List<UniversidadeModel>> getUniversities() async {
    try {
      var response = await dio
          .get('http://universities.hipolabs.com/search?country=suriname');
      if (response.statusCode == 200) {
        for (var json in response.data) {
          final universidade = json;
          universidades.add(universidade);
        }
      }
    } catch (error) {
      print("Error: " + error.toString());
      return universidades;
    }
    print(universidades);
    return universidades;
  }
}
