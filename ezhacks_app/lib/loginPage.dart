import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFF2E6175),
          child: Column(
            children: <Widget>[
              Spacer(flex: 6),
              Container(
                width: 200,
                height: 200,
                child:
                    Image.asset('assets/images/logo.png', fit: BoxFit.contain),
              ),
              Spacer(),
              Text(
                'app name',
                style: TextStyle(
                  letterSpacing: 4.0,
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Spacer(flex: 10),
              Container(
                width: 300,
                height: 80,
                decoration: new BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: new BorderRadius.all(Radius.circular(8.0)),
                ),
                child: TextButton(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  clipBehavior: Clip.none,
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),
              Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
