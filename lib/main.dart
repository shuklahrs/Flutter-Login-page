import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.indigo
      ),
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
              image: new AssetImage("assets/Login-background-image.jpg"),
              fit: BoxFit.fill,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                  child: new Theme(
                    data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.red,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                      color: Colors.lightGreenAccent, fontSize: 24.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                        children: <Widget>[
                           new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Enter Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Enter Password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          new Padding(padding: const EdgeInsets.only(top: 20.0),
                          ),
                          new MaterialButton(onPressed: () => {},
                            color: Colors.green,
                            textColor: Colors.white,
                            child: new Text("Login"),
                            splashColor: Colors.redAccent,
                            height: 40.0,
                            minWidth: 100.0,
                          ),
                        ],
                      ),
                  ),
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }
}