import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  final Map<String, Object> data;
  final double totalSum;

  ChartItem(this.data, this.totalSum);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(children: [
        Container(
          height: constraints.maxHeight * 0.15,
          child: Text(data['day'] as String),
        ),
        SizedBox(height: constraints.maxHeight * 0.05),
        Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 1),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    // heightFactor: (data['total'] as double) / totalSum,
                    heightFactor: totalSum == 0
                        ? 0
                        : (data['total'] as double) / totalSum,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          // color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                )
              ],
            )),
        SizedBox(
          height: constraints.maxHeight * 0.05,
        ),
        Container(
          height: constraints.maxHeight * 0.15,
          child: Text('\$${data['total']}'),
        ),
      ]);
    });
  }
}
