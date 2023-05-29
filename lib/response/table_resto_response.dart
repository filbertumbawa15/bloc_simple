import 'package:denice_ti4mb/models/table_resto_model.dart';

class TableRestoResponse{
  List<TableRestoModel> listTableResto = [];

  TableRestoResponse.fromJson(json){
    for (int i = 0; i < json.length; i++) {
      TableRestoModel tableRestoModel = TableRestoModel.fromJson(json[i]);
      listTableResto.add(tableRestoModel);
    } 
  }
}