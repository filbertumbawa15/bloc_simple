part of 'table_resto_bloc.dart';

@immutable
abstract class TableRestoState {}

class TableRestoInitial extends TableRestoState {}

class TableRestoLoading extends TableRestoState {}

class TableRestoLoaded extends TableRestoState {
  final List<TableRestoModel> listTableRestoModel;
  TableRestoLoaded({required this.listTableRestoModel});
}

class TableRestoError extends TableRestoState {
  final String message;
  TableRestoError({required this.message});
}
