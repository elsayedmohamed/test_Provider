import 'package:flutter/material.dart';
import 'package:provider_app/moduels/checkout.dart';
import 'package:provider_app/moduels/home_page.dart';
import 'package:provider_app/utilities/routes.dart';

class AppRouter {
  static Route<dynamic>? ongenrateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homePageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
          settings: settings,
        );

      case AppRoutes.checkOutRote:
        return MaterialPageRoute(builder: ((context) => const CheckOut()));

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
          settings: settings,
        );
    }
  }
}
