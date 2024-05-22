import 'package:flutter/material.dart';
import 'package:shipping_ui_app/widgets/status_bar.dart';
import 'package:shipping_ui_app/widgets/tracking_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => DashboardWidget();
}

class DashboardWidget extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [StatusBar(), TrackingBar()]);
  }
}
