import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ja_paguei/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  ExpenseCard({Key? key, this.expense, this.onDelete, this.onEdit})
      : super(key: key);

  final Expense? expense;
  final Function? onDelete;
  final Function? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            border:
                Border.all(width: 2, color: Color.fromARGB(255, 12, 129, 8)),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense!.date.toString(),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    expense!.title.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "R\$ " + expense!.cost!.toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ),
        startActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: _deleteExpense,
                backgroundColor: Color.fromARGB(255, 17, 131, 7),
                foregroundColor: Colors.white,
                icon: Icons.check,
                label: 'Pagar',
              ),
            ]),
        endActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: _editExpense,
                backgroundColor: Color.fromARGB(255, 185, 197, 8),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Editar',
              ),
            ]),
      ),
    );
  }

  void _editExpense(BuildContext context) {
    onEdit!(expense!);
  }

  void _deleteExpense(BuildContext context) {
    onDelete!(expense!.id);
  }
}
