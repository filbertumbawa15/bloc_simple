import 'package:denice_ti4mb/bloc/table_resto/table_resto_bloc.dart';
import 'package:denice_ti4mb/models/table_resto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableRestoIndexPage extends StatelessWidget {
  const TableRestoIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table Resto Page"),
      ),
      body: BlocProvider(
        create: ((context) => TableRestoBloc()..add(TableRestoIndexEvent())),
        child: BlocBuilder<TableRestoBloc, TableRestoState>(
          builder: ((context, state) {
            if (state is TableRestoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TableRestoError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is TableRestoLoaded) {
              return ListView.separated(
                  itemBuilder: ((context, index) {
                    TableRestoModel tableRestoModel =
                        state.listTableRestoModel[index];
                    return ListTile(
                      title: Text('${tableRestoModel.name}'),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return const Divider(thickness: 1.0);
                  }),
                  itemCount: state.listTableRestoModel.length);
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
