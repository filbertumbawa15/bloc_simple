import 'package:bloc/bloc.dart';
import 'package:denice_ti4mb/models/table_resto_model.dart';
import 'package:meta/meta.dart';

import '../../repo/table_resto_repository.dart';
import '../../response/table_resto_response.dart';

part 'table_resto_state.dart';

class TableRestoCubit extends Cubit<TableRestoState> {
  final tableRestoRepository = TableRestoRepository();
  TableRestoCubit() : super(TableRestoInitial()) {
    getTableResto();
  }

  void getTableResto() async {
    emit(TableRestoLoading());
    try {
      TableRestoResponse response =
          await tableRestoRepository.getAllTableResto();
      emit(TableRestoLoaded(response.listTableResto));
    } catch (e) {
      emit(TableRestoError(message: e.toString()));
    }
  }
}
