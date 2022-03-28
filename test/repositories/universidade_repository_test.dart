import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:uni_sulamerica/repositories/universidade_repository.dart';

void main() {
  final repository = UniversidadeRepository();

  test(
      'retorna as universidades de um determinado país como uma lista de UniversidadeModel',
      () async {
    final list = await repository.getUniversidades('brazil');
    //print(list);
    expect(list.length, greaterThan(0));
  });

  test('retorna as universidades de um determinado país como json', () async {
    final list = await repository.getUniversidades('brazil');
    String jsonUni = jsonEncode(list);
    //print(jsonEncode(jsonUni));
    expect(jsonUni, isNotNull);
  });
}
