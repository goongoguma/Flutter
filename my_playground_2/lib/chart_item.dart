import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              heightFactor: 0.3,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    // color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ));
  }
}
