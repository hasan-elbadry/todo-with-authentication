import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_authentcation/providers/todo_provider.dart';

import '../widgets/todo_item_widget.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  static const route = '/todo';

  @override
  Widget build(BuildContext context) {
    var username = ModalRoute.settingsOf(context)!.arguments.toString();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 350),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15),
            height: 250,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(130))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Todo App',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white),
                ),
                Text(
                  'User: $username',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<todoProvider>(
          builder: (context, provider, child) => ListView.separated(
              itemBuilder: (context, index) {
                if (provider.data.isEmpty) {
                  provider.getAll();
                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return todoItemWidget(
                    provider.data[index].todo,
                    'Description ${index + 1}',
                    provider.data[index].completed,
                    index);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: provider.data.isEmpty ? 1 : provider.data.length),
        ),
      ),
    );
  }
}
