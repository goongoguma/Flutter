import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widget/transaction_list.dart';
import 'model/transaction.dart';
import 'widget/transaction_form.dart';
// What is the difference between SingleChildScrollView ListView and ListView builder?
// https://stackoverflow.com/questions/62146197/what-is-the-difference-between-listview-and-singlechildscrollview-in-flutter#:~:text=SingleChildScrollView%3A%20is%20used%20when%20we%20have%20different%20widgets%20for%20n%20elements.&text=ListView()%20%2D%2D%20Render%20all,visible%20items%20on%20the%20screen.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.brown,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 10,
                    fontWeight: FontWeight.bold))),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(id: 'id1', title: '운동화', amount: 45000, date: DateTime.now()),
    Transaction(id: 'id2', title: '핸드폰', amount: 130000, date: DateTime.now()),
  ];

  void _addTransactions(String title, double amount) {
    final newItem = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    print(title);

    setState(() {
      transactions.add(newItem);
    });
  }

  void _startAddNewTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: TransactionForm(_addTransactions),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransactionModal(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Column에서 Card의 넓이나 높이를 조절하고 싶으면 Container로 감싸야함
            // 대신 Column안에 있는 아이템들의 위치는 조절 가능
            Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('CHART!'),
                  elevation: 5,
                )),
            TransactionList(transactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransactionModal(context),
      ),
    );
  }
}
