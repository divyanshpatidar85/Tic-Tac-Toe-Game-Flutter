// ignore: file_names
// import 'dart:ffi';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'packages/flutter/src/widgets/framework.dart';
import 'package:validator/logichelper.dart';

// ignore: camel_case_types
class Ui_of_Game extends StatefulWidget {
  const Ui_of_Game({super.key});

  @override
  State<Ui_of_Game> createState() => _Ui_of_GameState();
}

// ignore: camel_case_types
class _Ui_of_GameState extends State<Ui_of_Game> {
  String s = "";
  String trunplayer = "Player 1", colorss = "Red";
  String player1Name = "", player2Name = "";
  TextEditingController name1 = TextEditingController(),
      name2 = TextEditingController();
  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  List<Color> ConatColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  static int logicer = 0;
  @override
  void initState() {
    super.initState();

    // Check the condition and show the AlertDialog if the value is 10.

    // print("hello ");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showAlertDialog(context);

      // setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // if (logicer == 0){
          // AlertDialog(
          //   title: Text("hi"),
          //   // al=al++;
          // ),

          s.isEmpty
              ? Column(
                  children: [
                    Text(trunplayer,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: screenHeight * .04,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(colorss)
                  ],
                )
              : InkWell(
                  child: Column(
                    children: [
                      Text(s,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: screenHeight * .05,
                            fontWeight: FontWeight.bold,
                          )),
                      InkWell(
                        child: const Icon(
                          Icons.restart_alt_rounded,
                          size: 30,
                        ),
                        onTap: () {
                          ConatColor = [
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,
                          ];
                          game = List.generate(
                              3, (_) => List.generate(3, (_) => ' '));
                          s = "";
                          logicer = 0;
                          trunplayer = "Player 1";
                          colorss = "Red";
                          setState(() {});
                          _showAlertDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
          const Divider(
            color: Colors.black, // Customize the color of the divider
            // thickness: 2.0, // Set the thickness of the divider
            height: 30.0, // Set the height of the divider
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: fun(0),
                  ),
                  onTap: () => _incrementCounter(0, 0, 0)),
              const SizedBox(
                height: 5,
                width: 5,
              ),
              //second block
              InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: fun(1),
                  ),
                  onTap: () {
                    _incrementCounter(1, 0, 1);
                  }),
              sbfun(),
              //third block
              InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: fun(2),
                  ),
                  onTap: () => _incrementCounter(2, 0, 2)),
              sbfun(),
            ],
          ),
          sbfun(),
          Row(
            //first block
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: fun(3),
                  ),
                  onTap: () => _incrementCounter(3, 1, 0)),
              sbfun(),
              //second block
              InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: fun(4),
                  ),
                  onTap: () => _incrementCounter(4, 1, 1)),
              sbfun(),
              //third block
              InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: fun(5),
                  ),
                  onTap: () => _incrementCounter(5, 1, 2)),
              sbfun(),
            ],
          ),
          sbfun(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: fun(6),
                  ),
                  onTap: () => _incrementCounter(6, 2, 0)),
              sbfun(),
              //second block
              InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: fun(7),
                  ),
                  onTap: () => _incrementCounter(7, 2, 1)),
              sbfun(),
              //third block
              InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: fun(8),
                  ),
                  onTap: () => _incrementCounter(8, 2, 2)),
              sbfun(),
            ],
          ),
        ],
      ),
    );
  }

  void _incrementCounter(int i, int row, int column) {
    bool winnderDec = false;
    if ((logicer == 0 || logicer % 2 == 0) &&
        logicer <= 8 &&
        ConatColor[i] != Colors.blue &&
        ConatColor[i] != Colors.red) {
      player2Name.isEmpty ? trunplayer = "Player 2" : trunplayer = player2Name;
      colorss = "Blue";
      ConatColor[i] = Colors.red;
      winnderDec = player1(row, column);
      ++logicer;
      if (winnderDec == true) {
        logicer = 9;
        if (player1Name.isEmpty) {
          s = "Player1 is Winner";
        } else {
          s = "$player1Name is Winner";
        }
        print('player 1 is winnner');
      }
    } else if (logicer <= 8 &&
        ConatColor[i] != Colors.blue &&
        ConatColor[i] != Colors.red) {
      player1Name.isEmpty ? trunplayer = "Player 1" : trunplayer = player1Name;
      colorss = "Red";
      ConatColor[i] = Colors.blue;
      winnderDec = player2(row, column);
      ++logicer;
      if (winnderDec == true) {
        logicer = 9;
        if (player2Name.isEmpty) {
          s = "Player 2 is Winner";
        } else {
          s = "$player2Name is Winner";
        }
        // print('player 2 is winnner');
      }
    }
    if (logicer == 9 && s.isEmpty) {
      s = "Match is Draw";
    }

    setState(() {});
  }

  BoxDecoration fun(int i) {
    return BoxDecoration(
      // color: ConatColor[0],
      border: Border.all(
        color: Colors.black, // Border color
        width: 1, // Border width
        //
      ),
      color: ConatColor[i],
    );
  }

  SizedBox sbfun() {
    return const SizedBox(
      height: 5,
      width: 5,
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog'),
          content: Container(
            height: 100,
            width: 200,
            child: Column(children: [
              TextField(
                controller: name1,
                decoration: const InputDecoration(hintText: '1st Player Name'),
                onChanged: (e) {
                  player1Name = name1.text;

                  print('$trunplayer');
                },
              ),
              TextField(
                controller: name2,
                decoration: const InputDecoration(hintText: '2nd Player Name'),
                onChanged: (e) {
                  player2Name = name2.text;
                },
              ),
            ]),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // name1.text = "";
                // Do something when the user presses the 'OK' button.
                player1Name.isEmpty
                    ? trunplayer = "Player 1"
                    : trunplayer = player1Name;
                setState(() {});
                Navigator.of(context).pop(); // Close the alert dialog.
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
