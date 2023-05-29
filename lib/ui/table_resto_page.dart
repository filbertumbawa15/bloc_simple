import 'package:denice_ti4mb/cubit/table_resto/table_resto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableRestoPage extends StatelessWidget {
  const TableRestoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Table Resto"),
      ),
      body: BlocProvider(
        create: (context) => TableRestoCubit(),
        child: Container(),
      ),
    );
  }
}
