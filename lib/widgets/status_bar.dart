import 'package:flutter/material.dart';
import 'package:shipping_ui_app/routes/route.dart';
import 'package:shipping_ui_app/routes/route_generator.dart';

class StatusBar extends StatefulWidget {
  const StatusBar({super.key});

  @override
  State<StatefulWidget> createState() => CreateStatusBar();
}

class CreateStatusBar extends State<StatusBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 79, 91, 219),
        height: 50,
        child: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "2024-01-01 to 2024-03-31",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),
            const Expanded(
                child: SizedBox(
              width: 200,
            )),
            Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "BUDDYSHIELD",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),
            Container(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  child: const Text("Terms",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                )),
            const SizedBox(
              width: 2,
            ),
            Container(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    RouteGenerator.generateRoute(
                        Navigator.pushNamed(context, routeHome)
                            as RouteSettings);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  child: const Text(
                    "+Order",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: const Text(
                "Rs. 23432",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                child: const Text("Recharge",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(5),
                child: const Text(
                  "Faboulus",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ));
  }
}
