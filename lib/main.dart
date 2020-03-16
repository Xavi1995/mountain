import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _visible = true;

  bool _tapped = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/background.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _tapped ? 0 : 0.6,
              duration: Duration(milliseconds: 500),
              child: Container(
                color: Colors.black,
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              top: _tapped
                  ? constraints.maxHeight / 2.3
                  : constraints.maxHeight / 7,
              left: _tapped
                  ? (constraints.maxWidth / 2) * 0.42
                  : (constraints.maxWidth / 2) * 0.22,
              child: Text(
                'Let\'s walk',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 2.0),
              ),
            ),
            Positioned(
              top: constraints.maxHeight / 1.7,
              left: (constraints.maxWidth / 2) * 0.87,
              child: Visibility(
                visible: _tapped,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _tapped = !_tapped;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _tapped = !_tapped;
                  });
                },
                icon: Icon(
                  Icons.arrow_left,
                  color: Colors.black,
                ),
              ),
            ),
            AnimatedPositioned(
              top:
                  _tapped ? constraints.maxHeight : constraints.maxHeight / 1.7,
              child: Container(
                height: constraints.maxHeight / 1.5,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      60,
                    ),
                  ),
                ),
              ),
              duration: Duration(
                milliseconds: 400,
              ),
            ),
          ],
        );
      })

          /*Center(
              child: AnimatedOpacity(
                opacity: 0.0,
                duration: Duration(milliseconds: 200),
                child: Container(
                  width: 20,
                  height: 20,
                  color: Colors.red,
                ),
              ),
            ),
            */
          ),
    );
  }
}
