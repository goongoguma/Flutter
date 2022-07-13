import 'package:flutter/material.dart';
import 'package:my_playground6/provider/cart.dart';
import 'package:my_playground6/provider/products.dart';
import 'package:my_playground6/screens/tabs_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: Colors.brown, secondary: Colors.blueGrey)),
        // home: HomeScreen(),
        routes: {'/': (context) => TabsScreen()},
      ),
    );
  }
}
