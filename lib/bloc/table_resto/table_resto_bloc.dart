import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:denice_ti4mb/models/table_resto_model.dart';
import 'package:denice_ti4mb/repo/table_resto_repository.dart';
import 'package:denice_ti4mb/response/table_resto_response.dart';
import 'package:meta/meta.dart';

part 'table_resto_event.dart';
part 'table_resto_state.dart';

class TableRestoBloc extends Bloc<TableRestoEvent, TableRestoState> {
  final tableRestoRepository = TableRestoRepository();
  TableRestoBloc() : super(TableRestoInitial()) {
    on<TableRestoEvent>((event, emit) async {
      emit(TableRestoLoading());
      try {
        TableRestoResponse response =
            await tableRestoRepository.getAllTableResto();
        emit(TableRestoLoaded(listTableRestoModel: response.listTableResto));
      } catch (e) {
        emit(TableRestoError(message: e.toString()));
      }
    });
  }
}
