import 'package:denice_ti4mb/cubit/table_resto/table_resto_cubit.dart';
import 'package:denice_ti4mb/ui/order_menu/order_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:denice_ti4mb/models/table_resto_model.dart';

class TableRestoPage extends StatelessWidget {
  const TableRestoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Table Resto'),
      ),
      body: BlocProvider(
        create: (context) => TableRestoCubit(),
        child: BlocBuilder<TableRestoCubit, TableRestoState>(
          builder: (context, state) {
            if (state is TableRestoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TableRestoError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is TableRestoLoaded) {
              return GridView.count(
                crossAxisCount: 3,
                children:
                    List.generate(state.listTableRestoModel.length, (index) {
                  TableRestoModel tableRestoModel =
                      state.listTableRestoModel[index];
                  return TableRestoItem(
                    tableRestoModel: tableRestoModel,
                  );
                  // return Card(
                  //   color: tableRestoModel.table_status == 'Kosong'
                  //       ? Colors.grey
                  //       : Colors.green,
                  //   child: Center(
                  //     child: Text(
                  //       tableRestoModel.name.toString(),
                  //       style: TextStyle(fontSize: 20, color: Colors.white),
                  //     ),
                  //   ),
                  // );
                }),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class TableRestoItem extends StatelessWidget {
  TableRestoModel tableRestoModel;
  TableRestoItem({super.key, required this.tableRestoModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width: double.infinity,
                height: 200,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                          "Apakah anda memesan pada ${tableRestoModel.name}"),
                    ),
                    const Divider(thickness: 1.0),
                    ListTile(
                      title: const Text("Ya"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => OrderMenuPage(
                                    tableRestoModel: tableRestoModel))));
                      },
                    ),
                    const Divider(
                      thickness: 1.0,
                    ),
                    ListTile(
                      title: const Text("Batal"),
                      leading: const Icon(Icons.abc),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            });
      },
      child: Card(
        color: tableRestoModel.table_status == 'Kosong'
            ? Colors.grey
            : Colors.green,
        child: Center(
          child: Text(
            tableRestoModel.name.toString(),
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
