import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shipping_ui_app/widget_constants/colorz.dart';
import 'package:shipping_ui_app/widget_utils/utility.dart';
import 'package:shipping_ui_app/widgets/complex_drawer.dart';
import 'package:shipping_ui_app/widgets/navigation_bar.dart' as nav;

class AppView extends StatefulWidget {
  final Widget child;
  final bool showDrawer;

  const AppView({required this.child, this.showDrawer = true});

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late OverlayEntry entry;

  //final profileDropDown = ValueNotifier<bool>(false),
  //  uploadDropDown = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((_) => buildOverlay());
  }

  @override
  void dispose() {
    //profileDropDown.dispose();
    //uploadDropDown.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utility.isRunningOnWeb()
          ? PreferredSize(
              child: Container(),
              preferredSize: Size(0.0, 0.0),
            )
          : Utility.appBar(context),
      drawer: Utility.isRunningOnWeb()
          ? Container()
          : Theme(
              data: Theme.of(context).copyWith(
                // Set the transparency here
                canvasColor: Colors
                    .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
              ),
              child: ComplexDrawer(
                key: UniqueKey(),
              ),
            ),
      body: MouseRegion(
        onEnter: (event) {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            nav.NavigationBar(setStateFromOutside),
            Container(
              color: Colorz.verySlightlyGreyColor,
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Divider(
                  height: 2,
                  thickness: 0.6,
                ),
              ),
            ),
            Expanded(
              child: Container(
                  height: double.infinity,
                  color: Colorz.verySlightlyGreyColor,
                  child: widget.child),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> buildOverlay() async {
    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: 15,
          bottom: 15,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 285,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              margin: const EdgeInsets.only(top: 1),
              decoration: const BoxDecoration(
                //very slightly grey color
                color: Color.fromARGB(255, 230, 230, 230),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 10),
                    child: Icon(
                      Icons.wifi_off,
                      color: Colors.grey[500],
                    ),
                  ),
                  const Text(
                    "You are currently offline!",
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: IconButton(
                      onPressed: () => entry.remove(),
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    final overlay = Overlay.of(context);
    overlay.insert(entry);
  }

  void setStateFromOutside() {
    setState(() {
      ComplexDrawer.isExpandedAndVisible = false;
    });
  }
}
