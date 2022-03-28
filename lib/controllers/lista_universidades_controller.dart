import 'package:flutter/cupertino.dart';

import '../models/universidade.dart';
import '../repositories/universidade_repository.dart';

class ListaUniversidadesController {

  List<UniversidadeModel> universidades = [];
  final repository = UniversidadeRepository();

  final state =
      ValueNotifier<ListaUniversidadesState>(ListaUniversidadesState.start);

  Future start(String pais) async {
    state.value = ListaUniversidadesState.loading;
    try {
      universidades = await repository.getUniversidades(pais);
      state.value = ListaUniversidadesState.success;
    } catch (e) {
      state.value = ListaUniversidadesState.error;
    }
  }
}

enum ListaUniversidadesState {
  start,
  loading,
  success,
  error,
}
