import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_playground_2/chart_item.dart';

class Chart extends StatelessWidget {
  final List itemList;

  Chart(this.itemList);

  List<Map<String, Object>> get _transactionByDay {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double total = 0;

      for (var i = 0; i < itemList.length; i++) {
        if (itemList[i].date.day == weekDay.day &&
            itemList[i].date.month == weekDay.month &&
            itemList[i].date.year == weekDay.year) {
          total += itemList[i].amount;
        }
      }
      return {
        'total': total,
        'day': DateFormat.E().format(weekDay),
      };
    }).reversed.toList();
  }

  double get totalSum {
    return _transactionByDay.fold(0, (previousValue, element) {
      return previousValue + (element['total'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.amber),
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _transactionByDay.map((data) {
              return Flexible(
                  fit: FlexFit.tight, child: ChartItem(data, totalSum));
            }).toList()),
      ),
    );
  }
}
