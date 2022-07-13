import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/utilities/router.dart';
import 'package:provider_app/utilities/routes.dart';

import './model/cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.ongenrateRoutes,
        initialRoute: AppRoutes.homePageRoute,
      ),
    );
  }
}
