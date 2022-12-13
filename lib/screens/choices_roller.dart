import 'package:flutter/material.dart';
import 'package:lucky_roller/data.dart';
import 'package:lucky_roller/models/roller.dart';
import 'package:lucky_roller/screens/field_roller.dart';
import 'package:lucky_roller/screens/stock_spin.dart';

class ChoicesRoller extends StatelessWidget {
  const ChoicesRoller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1412),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF885849),
        title: const Text('LuckyRoller'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 1,
          mainAxisSpacing: 32,
          crossAxisSpacing: 32,
          crossAxisCount: 2,
        ),
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Field(),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFF885849),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/custom.png",
                    width: 90,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Custom",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          for (final category in data)
            Row(
              children: [
                for (Roller roll in (category.items))
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StockWheel(
                            wheelname: category.things,
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFF885849),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (roll.imageUrl.isNotEmpty)
                              Image.asset(
                                roll.imageUrl,
                                width: 90,
                              ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              roll.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
