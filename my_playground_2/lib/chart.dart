import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_playground_2/chart_item.dart';

class Chart extends StatelessWidget {
  final List itemList;

  Chart(this.itemList);

  List<Map<String, Object>> get _transactionByDay {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double sum = 0;

      for (var i = 0; i < itemList.length; i++) {
        if (itemList[i].date.day == weekDay.day &&
            itemList[i].date.month == weekDay.month &&
            itemList[i].date.year == weekDay.year) {
          sum += itemList[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': sum,
      };
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
              return Column(
                children: [
                  Container(
                    child: Text('chart'),
                  ),
                  SizedBox(height: 5),
                  ChartItem()
                ],
              );
            }).toList()),
      ),
    );
  }
}
