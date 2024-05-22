import 'package:flutter/material.dart';
import 'package:shipping_ui_app/widgets/custom_status_widget.dart';

class TrackingBar extends StatefulWidget {
  const TrackingBar({super.key});

  @override
  State<StatefulWidget> createState() => OrderTrackingBar();
}

class OrderTrackingBar extends State<TrackingBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            padding: EdgeInsets.zero,
            child: StatusWidget("Hello", 10, 200, 200),
          ),
          Expanded(
            child: Column(children: [
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.only(top: 10, left: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                              labelText: "Track AWB",
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      )),
                  Container(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 5),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        child: const Text(
                          "Track",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ],
              ),
              Row(
                children: [
                  Flexible(child: StatusWidget("A", 1, 200, 50)),
                  Flexible(child: StatusWidget("A", 1, 200, 50)),
                  Flexible(child: StatusWidget("A", 1, 200, 50)),
                  Flexible(child: StatusWidget("A", 1, 200, 50)),
                  Flexible(child: StatusWidget("A", 1, 200, 50)),
                  Flexible(child: StatusWidget("A", 1, 200, 50)),
                ],
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
