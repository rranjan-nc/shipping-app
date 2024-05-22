import 'package:flutter/material.dart';
import 'package:shipping_ui_app/main.dart';
import 'package:shipping_ui_app/models/complex_drawer_menu.dart';
import 'dart:math';

import 'package:shipping_ui_app/widget_constants/colorz.dart';
import 'package:shipping_ui_app/widgets/complex_text.dart';

class ComplexDrawer extends StatefulWidget {
  ComplexDrawer({required Key key}) : super(key: key);

  static bool isExpanded = true;
  static bool isExpandedAndVisible = true;

  @override
  _ComplexDrawerState createState() => _ComplexDrawerState();
}

class _ComplexDrawerState extends State<ComplexDrawer> {
  int selectedIndex = -1; //dont set it to 0

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade200,
            Colors.grey.shade300,
            Colors.grey.shade400,
          ],
        ),
      ),
      child: row(),
    );
  }

  Widget row() {
    return Row(children: [
      blackIconTiles(),
      //invisibleSubMenus(),
    ]);
  }

  Widget blackIconTiles() {
    return AnimatedContainer(
      onEnd: () {
        setState(() {
          ComplexDrawer.isExpandedAndVisible = ComplexDrawer.isExpanded;
        });
      },
      curve: Curves.bounceInOut,
      duration: Duration(milliseconds: 200),
      width: MediaQuery.of(context).size.width *
          (ComplexDrawer.isExpanded ? 0.18 : 0.05),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(pi / 4),
          colors: [
            Colorz.greyShade200,
            Colorz.greyShade200,
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cdms.length,
              itemBuilder: (BuildContext context, int index) {
                //  if(index==0) return controlTile();

                ComplexDrawerMenu cdm = cdms[index];
                bool selected = selectedIndex == index;
                return Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                      tilePadding: const EdgeInsets.only(left: 25.0),
                      backgroundColor: Colorz.verySlightlyGreyColor,
                      onExpansionChanged: (z) {
                        setState(() {
                          selectedIndex = z ? index : -1;
                        });
                      },
                      leading: Icon(cdm.icon,
                          color: selected
                              ? Theme.of(context).primaryColor
                              : Colors.black54),
                      title: ComplexDrawer.isExpandedAndVisible
                          ? Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: ComplexText(
                                fontSize: 15,
                                text: cdm.title,
                                color: selected
                                    ? Theme.of(context).primaryColor
                                    : Colors.black87,
                              ),
                            )
                          : SizedBox(
                              width: 0,
                              height: 0,
                            ),
                      trailing: ComplexDrawer.isExpandedAndVisible
                          ? (cdm.submenus.isEmpty
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : Icon(
                                  selected
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_right,
                                  color: Colors.black54,
                                ))
                          : SizedBox(
                              width: 0,
                              height: 0,
                            ),
                      children: cdm.submenus.map((subMenu) {
                        return sMenuButton(subMenu, false);
                      }).toList()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget controlTile() {
  //   return Padding(
  //     padding: EdgeInsets.only(top: 20, bottom: 30),
  //     child: ListTile(
  //       leading: FlutterLogo(),
  //       title: ComplexText(
  //         text: "Loan Bazaar",
  //         fontSize: 18,
  //         color: Colors.white,
  //         fontWeight: FontWeight.bold,
  //       ),
  //       onTap: expandOrShrinkDrawer,
  //     ),
  //   );
  // }

  // Widget blackIconMenu() {
  //   return AnimatedContainer(
  //     duration: Duration(milliseconds: 200),
  //     width: MediaQuery.of(context).size.width * 0.05,
  //     color: Colorz.slightlyGreyColor,
  //     child: Column(
  //       children: [
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Expanded(
  //           child: ListView.builder(
  //               itemCount: cdms.length,
  //               itemBuilder: (contex, index) {
  //                 // if(index==0) return controlButton();
  //                 return InkWell(
  //                   onTap: () {
  //                     setState(() {
  //                       selectedIndex = index;
  //                     });
  //                   },
  //                   child: Container(
  //                     height: 45,
  //                     alignment: Alignment.center,
  //                     child: Icon(cdms[index].icon, color: Colors.black54),
  //                   ),
  //                 );
  //               }),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget invisibleSubMenus() {
    // List<CDM> _cmds = cdms..removeAt(0);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: ComplexDrawer.isExpanded ? 0 : 10,
      color: Colors.transparent.withOpacity(0.0),
      child: Column(
        children: [
          Container(height: 95),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (context, index) {
                  ComplexDrawerMenu cmd = cdms[index];
                  // if(index==0) return Container(height:95);
                  //controll button has 45 h + 20 top + 30 bottom = 95

                  bool selected = selectedIndex == index;
                  bool isValidSubMenu = selected && cmd.submenus.isNotEmpty;
                  return subMenuWidget(
                      [cmd.title]..addAll(cmd.submenus), isValidSubMenu);
                }),
          ),
        ],
      ),
    );
  }

  Widget controlButton() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 30),
      child: InkWell(
        onTap: expandOrShrinkDrawer,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: FlutterLogo(
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget subMenuWidget(List<String> submenus, bool isValidSubMenu) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isValidSubMenu ? submenus.length.toDouble() * 37.5 : 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isValidSubMenu
              ? Colorz.complexDrawerBlueGrey
              : Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: ListView.builder(
          padding: EdgeInsets.all(6),
          itemCount: isValidSubMenu ? submenus.length : 0,
          itemBuilder: (context, index) {
            String subMenu = submenus[index];
            return sMenuButton(subMenu, index == 0);
          }),
    );
  }

  Widget sMenuButton(String subMenu, bool isTitle) {
    return InkWell(
      onTap: () {
        //handle the function
        //if index==0? donothing: doyourlogic here
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ComplexText(
          text: subMenu,
          fontSize: isTitle ? 17 : 14,
          color: isTitle ? Colors.black87 : Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget accountButton({bool usePadding = true}) {
    return Padding(
        padding: EdgeInsets.all(usePadding ? 8 : 0),
        child: InkWell(
            child: Text("Login"),
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(
                            title: 'Shipping',
                          )));
            }));
  }
  /*
  Widget accountButton({bool usePadding = true}) {
    return Padding(
      padding: EdgeInsets.all(usePadding ? 8 : 0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white70,
          image: DecorationImage(
            image: AssetImage("images/KADELAL.jpeg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
  */

  static List<ComplexDrawerMenu> cdms = [
    // CDM(Icons.grid_view, "Control", []),

    ComplexDrawerMenu(Icons.grid_view, "Dashboard", []),
    ComplexDrawerMenu(Icons.subscriptions, "Profile", ["Personal", "Business"]),
    ComplexDrawerMenu(
        Icons.markunread_mailbox, "Loan", ["Personal", "Home", "Vehicle"]),
    ComplexDrawerMenu(Icons.pie_chart, "Analytics",
        ["Bureau Report Analytics", "Bank Statement Analytics"]),
    ComplexDrawerMenu(Icons.trending_up, "Chart", []),

    //ComplexDrawerMenu(Icons.power, "Plugins",
    //  ["Ad Blocker", "Everything Https", "Dark Mode"]),
    //ComplexDrawerMenu(Icons.explore, "Explore", []),
    ComplexDrawerMenu(Icons.settings, "Settings", []),
  ];

  void expandOrShrinkDrawer() {
    setState(() {
      ComplexDrawer.isExpanded = !ComplexDrawer.isExpanded;
    });
  }
}
