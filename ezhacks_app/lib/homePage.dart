import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: const Text('Home'),
        backgroundColor: Color(0xFF2E6175),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFDAF0EE),
        child: Column(
          children: <Widget>[
            Spacer(flex: 1),
            Container(
              width: 300,
              height: 80,
              decoration: new BoxDecoration(
                color: Color(0xFF2E6175), //.withOpacity(0.2),
                borderRadius: new BorderRadius.all(Radius.circular(8.0)),
              ),
              child: TextButton(
                child: Text(
                  'Press',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                clipBehavior: Clip.none,
                onPressed: () {
                  Navigator.pushNamed(context, '/ar');
                },
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
