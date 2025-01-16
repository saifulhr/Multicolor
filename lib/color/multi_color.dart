import 'package:flutter/material.dart';
import 'package:multicolor_changing/color/colorlist_json.dart';

class MultiColor extends StatefulWidget {
  const MultiColor({super.key});

  @override
  State<MultiColor> createState() => _MultiColorState();
}

class _MultiColorState extends State<MultiColor> {
  Color selectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: selectedColor,
                  width: double.infinity,
                  height: 200,
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: colorlist.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = colorlist[index];
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: colorlist[index],
                          shape: BoxShape.circle,
                        ),
                        child: selectedColor == colorlist[index]
                            ? Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              )
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
