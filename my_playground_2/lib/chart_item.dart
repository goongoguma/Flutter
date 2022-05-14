import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  final Map<String, Object> data;
  final double totalSum;

  ChartItem(this.data, this.totalSum);

  @override
  Widget build(BuildContext context) {
    print((data['total'] as double) / totalSum);
    return Column(children: [
      Container(
        child: Text(data['day'] as String),
      ),
      SizedBox(height: 5),
      Container(
          height: 40,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 1),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: (data['total'] as double) / totalSum,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      // color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ))
    ]);
  }
}
