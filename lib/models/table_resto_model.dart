class TableRestoModel {
  int? id;
  String? code;
  String? name;
  int? capacity;
  String? table_status;
  String? status;

  TableRestoModel(this.id, this.code, this.name, this.capacity,
      this.table_status, this.status);
  TableRestoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    capacity = json['capacity'];
    table_status = json['table_status'];
    status = json['status'];
  }
}
