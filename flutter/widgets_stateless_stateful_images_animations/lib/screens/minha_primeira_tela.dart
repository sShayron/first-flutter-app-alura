import 'package:flutter/material.dart';

class MinhaPrimeiraTela extends StatelessWidget {
  const MinhaPrimeiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                ),
                Container(color: Colors.blue, width: 50, height: 50)
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
                Container(color: Colors.red, width: 50, height: 50)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.cyan,
                  height: 50,
                  width: 50,
                ),
                Container(color: Colors.pinkAccent, height: 50, width: 50),
                Container(color: Colors.purple, height: 50, width: 50)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                        color: Colors.amber,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Linha amber',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        )))
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // print("Voce apertou o botão");
              },
              child: Text("Aperte o botão"),
            )
          ],
        ));
  }
}
