import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

Widget todoItemWidget(
    String header, String description, bool isCompleted, int index) {
  return Consumer<todoProvider>(
    builder: (context, provider, child) => ListTile(
      leading: IconButton(
          onPressed: () {
            provider.checkPressed(index);
          },
          icon: Icon(
            isCompleted
                ? Icons.check_box
                : Icons.check_box_outline_blank_outlined,
            size: 30,
            color: isCompleted ? Colors.green : Colors.black,
          )),
      tileColor: const Color(0xeeeeeeee),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(
                fontWeight: isCompleted ? FontWeight.normal : FontWeight.bold,
                fontSize: isCompleted ? 20 : 25,
                color: isCompleted ? Colors.grey : Colors.black,
                overflow: TextOverflow.ellipsis,
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          Text(description,
              style: TextStyle(
                  fontWeight: isCompleted ? FontWeight.normal : FontWeight.bold,
                  fontSize: isCompleted ? 20 : 20,
                  color: isCompleted ? Colors.grey : Colors.black,
                  overflow: TextOverflow.ellipsis,
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none))
        ],
      ),
      trailing: IconButton(
          onPressed: () {
            provider.remove(index);
          },
          icon: const Icon(
            Icons.remove_circle_outline,
            size: 30,
            color: Colors.red,
          )),
    ),
  );
}
