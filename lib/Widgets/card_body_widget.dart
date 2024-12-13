import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class CardBody extends StatelessWidget {
  CardBody(
      {super.key,
      required this.item,
      required this.handleDeleteTask,
      required this.index});

  var item;
  final Function handleDeleteTask;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 74,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: (index % 2 == 0)
            ? const Color.fromARGB(255, 51, 240, 246)
            : const Color.fromARGB(255, 241, 141, 233),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(item.id),
            InkWell(
                onTap: () async {
                  if (await confirm(context)) {
                    handleDeleteTask(item.id);
                  }
                  return;
                },
                child: const Icon(Icons.delete_outline)),
          ],
        ),
      ),
    );
  }
}
