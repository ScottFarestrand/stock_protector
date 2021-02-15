import 'package:flutter/material.dart';
import 'package:stock_protector/widgets/snackBarPage.dart';
import '../constants.dart';

TextEditingController _emailTextController = TextEditingController();
TextEditingController _passwordTextController = TextEditingController();
TextEditingController _confirmPasswordTextController = TextEditingController();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    final _snackBar = SnackBar(content: Text('Welcome to woolha.com'));
    TextEditingController _userNameTextController = TextEditingController();
    final node = FocusScope.of(context);
    editInputs() {
      print("editing");
      if (_userNameTextController.text.length < 3) {
        print(_userNameTextController.text.length);
        _showScaffold("User name must be at least 3 characters");
        return;
      }
      if (_passwordTextController.text.length < 6) {
        _showScaffold("Password must be at least 6 characters long");
        return;
      }
      if (_passwordTextController.text != _confirmPasswordTextController.text) {
        _showScaffold("Password don't Match");
        return;
      }
    }

    Color _myblue = hexToColor(colorBlue);
    Color _myDarkGreen = hexToColor(colorDarkGreen);
    Color _myMediumGreen = hexToColor(colorMediumGreen);
    Color _myLightGreen = hexToColor(colorLightGreen);

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _myblue,
              _myblue,
              _myDarkGreen,
              _myMediumGreen,
              // _myMediumGreen,
              // _myLightGreen,
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  // color: Colors.transparent
                  width: 300,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    // keyboardType: TextInputType.emailAddress,
                    controller: _userNameTextController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 2, style: BorderStyle.none),
                        ),
                        hintText: "Select a User Name",
                        labelText: 'User Name'),
                  ),
                ),
                Divider(),
                Container(
                  // color: Colors.transparent
                  width: 300,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTextController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 2, style: BorderStyle.none),
                        ),
                        hintText: "Your Email Address",
                        labelText: 'Email Address'),
                  ),
                ),
                Divider(),
                Container(
                  // color: Colors.transparent
                  width: 300,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    obscureText: true,
                    controller: _passwordTextController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 4, style: BorderStyle.none),
                        ),
                        hintText: "Your a Password",
                        labelText: 'Password'),
                  ),
                ),
                Divider(),
                Container(
                  // color: Colors.transparent
                  width: 300,
                  child: TextField(
                    // textInputAction: TextInputAction.next,
                    // onEditingComplete: () => node.nextFocus(),
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => node.unfocus(),
                    obscureText: true,
                    controller: _confirmPasswordTextController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 6, style: BorderStyle.none),
                        ),
                        hintText: "Confirm Your Password",
                        labelText: 'Confirm Password'),
                  ),
                ),
                Divider(),
                Container(
                  // color: Colors.transparent
                  width: 300,
                  child: FlatButton(
                    color: _myblue,
                    height: 60,
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      editInputs();
                    },
                    // onPressed: () {
                    //   print("editing");
                    //   _showScaffold("This is a SnackBar.");
                    // },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                // SnackBarPage(),
              ]),
        ),
      ),
    );
  }
}
