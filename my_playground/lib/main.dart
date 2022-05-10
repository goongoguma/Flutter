import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/widget/transaction_list.dart';
import 'model/transaction.dart';
import 'widget/transaction_form.dart';
import 'widget/chart.dart';
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
        errorColor: Colors.deepOrange,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              button: TextStyle(color: Colors.white),
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
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransactions(String title, double amount, DateTime selectedDate) {
    final newItem = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: selectedDate);

    setState(() {
      _transactions.add(newItem);
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

  void _deleteTransaction(String id) {
    setState((() => _transactions.removeWhere((tx) => tx.id == id)));
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery를 하나의 변수로 사용하게 되면 계속되는 렌더링을 방지한다
    final mediaQuery = MediaQuery.of(context);
    final isLandScape = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget _appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Flutter App IOS'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransactionModal(context),
                )
              ],
            ),
          )
        : AppBar(
            title: Text('Flutter App Android'),
            actions: [
              IconButton(
                  onPressed: () => _startAddNewTransactionModal(context),
                  icon: Icon(Icons.add))
            ],
          );
    final transactionWidget = Container(
        height: (mediaQuery.size.height -
                _appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: TransactionList(_transactions, _deleteTransaction));
    final _pageBody = SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isLandScape)
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Show Chart'),
              Switch.adaptive(
                value: _showChart,
                onChanged: (val) {
                  setState(() {
                    _showChart = val;
                  });
                },
              ),
            ]),
          if (isLandScape)
            _showChart
                ? Container(
                    height: (mediaQuery.size.height -
                            _appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.7,
                    child: Chart(_recentTransactions),
                  )
                : transactionWidget,
          if (!isLandScape)
            Container(
              height: (mediaQuery.size.height -
                      _appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.3,
              child: Chart(_recentTransactions),
            ),
          if (!isLandScape) transactionWidget
        ],
      ),
    );
    return Platform.isAndroid
        ? Scaffold(
            appBar: _appBar,
            body: _pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransactionModal(context),
            ),
          )
        : CupertinoPageScaffold(
            navigationBar: _appBar,
            child: _pageBody,
          );
  }
}
