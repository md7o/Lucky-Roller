import 'dart:async';
import 'package:lucky_roller/models/roller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:lucky_roller/screens/choices_roller.dart';

// ignore: must_be_immutable
class StockWheel extends StatefulWidget {
  StockWheel({Key? key, required this.wheelname}) : super(key: key);

  List<Hlao> wheelname;

  @override
  State<StockWheel> createState() => _StockWheelState();
}

class _StockWheelState extends State<StockWheel> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final items = <String>[
    //   'hlao',
    //   'glao',
    //   'flao',
    // ];

    return Scaffold(
      backgroundColor: const Color(0xFF1A1412),
      appBar: AppBar(
        backgroundColor: const Color(0xFF885849),
        title: const Text("Custom Roller"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: FortuneWheel(
                selected: selected.stream,
                animateFirst: false,
                onFling: () {},
                physics: CircularPanPhysics(
                  duration: const Duration(seconds: 2),
                  curve: Curves.decelerate,
                ),
                indicators: const <FortuneIndicator>[
                  FortuneIndicator(
                    alignment: Alignment.topCenter,
                    child: TriangleIndicator(
                      color: Colors.white,
                    ),
                  ),
                ],
                items: [
                  for (var items in widget.wheelname)
                    FortuneItem(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          items.spinName,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      style: const FortuneItemStyle(
                        color: Color(
                            0xFF885849), // <-- custom circle slice fill color
                        borderColor: Color(
                            0xFF1A1412), // <-- custom circle slice stroke color
                        borderWidth: 2, // <-- custom circle slice stroke width
                      ),
                    ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 30),
            //   child: Text(
            //     widget.wheelname[0],
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 25,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            GestureDetector(
                child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: SizedBox(
                width: 142,
                height: 51,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF885849),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      selected.add(
                        Fortune.randomInt(0, widget.wheelname.length),
                      );
                    });
                  },
                  child: const Center(
                      //  BorderRadius: BorderRadius.circular(15)
                      child: Text(
                    'Spin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF885849),
        shape: const CircularNotchedRectangle(),
        child: Container(height: 40.0),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment Counter',
        backgroundColor: const Color(0xFF603D32),
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ChoicesRoller(),
          ),
        ),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
