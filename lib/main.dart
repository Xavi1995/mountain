import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _visible = true;
  

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
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
            AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    top: constraints.maxHeight / 2,
                    left: (constraints.maxWidth / 2) * 0.35,
                    child: Text(
                      'Let\'s walk',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 2.0),
                    ),
                  ),
          ],
        );
          }
        )

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
