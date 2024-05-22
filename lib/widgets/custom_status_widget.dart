import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatusWidget extends StatelessWidget {
  String name = 'widget';
  int count = 0;
  double width;
  double height;
  StatusWidget(this.name, this.count, this.width, this.height, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, top: 5, right: 5, bottom: 5),
      width: width,
      child: Card(
        color: const Color.fromARGB(255, 168, 181, 218),
        elevation: 150,
        child: Container(
          width: 50,
          height: 150,
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              const Row(
                children: <Widget>[
                  Expanded(
                      child: SizedBox(
                    height: 70,
                  ))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      count.toString(),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
