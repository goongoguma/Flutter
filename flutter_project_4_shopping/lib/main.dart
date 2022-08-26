import 'package:flutter/material.dart';
import 'package:flutter_project_shopping/provider/orders.dart';
import 'package:flutter_project_shopping/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './provider/products.dart';
import './provider/cart.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';

void main() {
  runApp(const MyApp());
}
// 테스트 이미지
// https://3.bp.blogspot.com/_b0xJ7qk6DTc/TBH31EKfUPI/AAAAAAAAAqM/nvwdLmtlRIA/s320/Flower.jpg

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

//   final url = Uri.https('flutter-update.firebaseio.com', '/products.json')
// http.post(url, ...)

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // 새로운 클래스의 인스턴스를 만들때는 create 사용을 권장
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders())
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProduceOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen()
        },
      ),
    );
  }
}
