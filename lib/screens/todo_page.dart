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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modalsheet(context);
        },
      ),
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 350),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15),
            height: 250,
            decoration: const BoxDecoration(
                color: Colors.deepPurple,
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

void modalsheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.deepPurple,
    context: context,
    builder: (context) => Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add todo',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),
          ),
          TextFormField(
            style: const TextStyle(fontSize: 25),
            decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xeeeeffff),
                contentPadding: EdgeInsets.all(20),
                label: Text(
                  'Header',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(22)))),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Text('add'),
          )
        ],
      ),
    ),
  );
}
