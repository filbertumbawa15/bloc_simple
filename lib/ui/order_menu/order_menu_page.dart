import 'package:denice_ti4mb/models/table_resto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderMenuPage extends StatelessWidget {
  TableRestoModel tableRestoModel;
  OrderMenuPage({super.key, required this.tableRestoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Menu"),
      ),
      body: Container(
          child: Text("Halaman Order Menu pada ${tableRestoModel.name}")),
    );
  }
}
