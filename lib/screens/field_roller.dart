import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lucky_roller/models/localy.dart';
import 'dart:core';
import 'package:lucky_roller/screens/spin_wheel.dart';

class Field extends StatefulWidget {
  const Field({super.key});

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  List<Localy> rolylist = [];
  final localBox = Hive.box<Localy>('localy');
  final controller = TextEditingController();

  void updateContact(item) async {
    try {
      await localBox.add(item);

      print(localBox.values);
    } catch (e) {
      print(e);
    } finally {
      controller.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      rolylist.addAll(localBox.values);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1412),
      appBar: AppBar(
        title: const Text('Field'),
        backgroundColor: const Color(0xFF885849),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: controller,
                // decoration

                decoration: const InputDecoration(
                    counterStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: 'The Name',
                    hintStyle: TextStyle(color: Colors.white30),
                    focusColor: Colors.orange,
                    filled: true),

                // decoration

                maxLength: 14,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF885849),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    "Add",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();

                  setState(() {
                    rolylist.add(Localy(name: controller.text));
                  });

                  updateContact(Localy(name: controller.text));
                }),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: rolylist
                  .map((element) => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color(0xFF885849),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  element.name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color(0xFFFF7676),
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    localBox
                                        .deleteAt(rolylist.indexOf(element));
                                    setState(() => rolylist.remove(element));
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF885849),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () => {
                      // ignore: avoid_print
                      if (rolylist.length <= 1)
                        {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'You must write more than 1 content'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Okay')),
                              ],
                            ),
                          )
                        }
                      else
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpinWheel(
                                content: rolylist.map((e) => e.name).toList(),
                              ),
                            ),
                          ),
                        }
                    },
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'Start',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
