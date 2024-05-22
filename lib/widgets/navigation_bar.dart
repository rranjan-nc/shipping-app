import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shipping_ui_app/routes/route.dart';
import 'package:shipping_ui_app/widget_constants/colorz.dart';
import 'package:shipping_ui_app/widget_constants/imagez.dart';
import 'package:shipping_ui_app/widget_constants/styles.dart';

class NavigationBar extends StatefulWidget {
  Function setStateFromOutside;

  NavigationBar(this.setStateFromOutside);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int index = 0;

  ValueNotifier indexValue = ValueNotifier<int>(0);

  final GlobalKey _menuKey = GlobalKey();
  late OverlayEntry entry;

  late Offset buttonPosition;

  late bool _mouseIsConnected;

  @override
  void initState() {
    super.initState();
    _mouseIsConnected = RendererBinding.instance.mouseTracker.mouseIsConnected;
  }

  @override
  Widget build(BuildContext context) {
    index = getIndex(ModalRoute.of(context)!.settings.name);
    indexValue = ValueNotifier<int>(index);

    return LayoutBuilder(
      builder: (context, cons) => Material(
        child: Container(
          color: Colorz.verySlightlyGreyColor,
          child: Center(
            child: Container(
                key: _menuKey,
                height: 75.0,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width > 1000
                      ? MediaQuery.of(context).size.width / 9
                      : 20,
                  right: MediaQuery.of(context).size.width > 1000
                      ? MediaQuery.of(context).size.width / 10
                      : 20,
                ),
                decoration: const BoxDecoration(
                  color: Colorz.verySlightlyGreyColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, routeUserHomePage);
                        },
                        child: Image.asset(
                          Imagez.logo_image,
                          width: 170,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(),
                          ),
                          DrawNavItem(context, indexValue.value == 0,
                              "Dashboard", routeDashboard, indexValue, cons),
                          DrawNavItem(context, indexValue.value == routeHome,
                              "Home", routeUserHomePage, indexValue, cons),
                          DrawNavItem(
                              context,
                              indexValue.value == 5,
                              "Shipping Details",
                              routeUserHomePage,
                              indexValue,
                              cons),
                          DrawNavItem(context, indexValue.value == 6, "Profile",
                              routeAbout, indexValue, cons),
                          Expanded(
                            flex: 2,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget DrawNavItem(BuildContext context, bool selected, String title,
      String routeName, ValueNotifier notifyValue, BoxConstraints cons) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(getOptPadding(cons), 9, getOptPadding(cons), 0),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
          overlayColor: MaterialStateProperty.all(
              selected ? Colors.transparent : Colorz.heading1Light),
          splashFactory: NoSplash.splashFactory,
          minimumSize: MaterialStateProperty.all(Size(50, 50)),
          backgroundColor: MaterialStateProperty.all(
              selected ? Colorz.heading1 : Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: () {
          navKey.currentState!.pushNamed(routeName);
        },
        child: Text(title,
            style: (selected)
                ? kPageTitleStyle.copyWith(color: Colors.white)
                : kPageTitleStyle),
      ),
    );
  }

  int getIndex(String? name) {
    switch (name) {
      case routeUserHomePage:
        return 0;
      case routeAbout:
        return 1;
      case routeContacts:
        return 2;
      case routeCreateOrder:
        return 3;
      case routeLogin:
        return 4;
      case routeUserHomePage:
        return 5;
    }
    return 0;
  }

  double getOptPadding(BoxConstraints cons) {
    if (cons.maxWidth > 1600) {
      return 20;
    } else if (cons.maxWidth > 1100) {
      return 15;
    } else if (cons.maxWidth > 800) {
      return 10;
    } else {
      return 0;
    }
  }

  void buildOverlay() {
    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          right: 25,
          top: 72,
          child: Container(
            width: 325,
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            margin: const EdgeInsets.only(top: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 2,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Column(
              children: <Widget>[
                Text("Internet connection lost!"),
              ],
            ),
          ),
        );
      },
    );
    final overlay = Overlay.of(context);
    overlay.insert(entry);
  }
}

List<Widget> buildProfileItems(BuildContext context) {
  final List<String> menuTitles = ['Profile', 'Logout'];
  List<Widget> menuItems = [];
  menuItems.add(DrawerHeader(
    decoration: BoxDecoration(color: Colors.blueGrey),
    child: Text(
      'Profile',
      style: TextStyle(color: Colors.white, fontSize: 28),
    ),
  ));
  menuTitles.forEach((element) {
    menuItems.add(ListTile(
      title: Text(element, style: TextStyle(fontSize: 18)),
      onTap: () {
        switch (element) {
          case 'Profile':
            break;
          case 'Logout':
            break;
        }
      },
    ));
  });
  return menuItems;
}
