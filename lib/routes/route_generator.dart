import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shipping_ui_app/app_view.dart';
import 'package:shipping_ui_app/main.dart';
import 'package:shipping_ui_app/pages/dashboard_page.dart';
import 'package:shipping_ui_app/pages/order_form_page.dart';
import 'package:shipping_ui_app/routes/route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    MaterialPageRoute pageRoute;
    switch (settings.name) {
      case routeHome:
        pageRoute = MaterialPageRoute(
            settings: settings,
            builder: (context) =>
                const AppView(showDrawer: true, child: OrderFormPage()));
        break;
      case routeCreateOrder:
        pageRoute = MaterialPageRoute(
          settings: settings,
          builder: ((context) => const OrderFormPage()),
        );
        break;
      case routeDashboard:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                const AppView(showDrawer: true, child: DashboardPage()));

      default:
        pageRoute = MaterialPageRoute(
          settings: settings,
          builder: ((context) => const MyHomePage(title: 'Page not found')),
        );
    }
    return pageRoute;
  }
}
