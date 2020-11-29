import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';
  String email, password;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldkey = new GlobalKey<ScaffoldState>();
  final AuthService _auth = AuthService();
  String email, password, check, error;
  bool enabled = false;
  bool checked = false;
  bool _validate = false;
  bool _passwordVisible = false;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: scaffoldkey,
          appBar: AppBar(
            title: Text('Freshmart'),
            backgroundColor: Colors.blue,
          ),
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/login.jpg'),
                      radius: 90,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Container(
                    width: 400,
                    margin: EdgeInsets.all(15.0),
                    child: Form(
                      key: _key,
                      autovalidate: _validate,
                      child: formUI(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget formUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.mail),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder()),
            keyboardType: TextInputType.emailAddress,
            validator: (email) => EmailValidator.validate(email)
                ? null
                : "Invalid Email Address.",
            onSaved: (String value) {
              email = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  border: OutlineInputBorder()),
              keyboardType: TextInputType.text,
              validator: (value) {
                Pattern pattern =
                    r'^(?=.*\d)(?=.*[A-Za-z])[0-9A-Za-z@#!$%]{8,12}$';
                RegExp regex = new RegExp(pattern);
                if (value.length == 0) {
                  return 'Password is required.';
                } else if (!regex.hasMatch(value)) {
                  return 'Password must have atleast 1 digit, 8-12 characters.';
                } else
                  return null;
              },
              onSaved: (String value) {
                password = value;
              }),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: GestureDetector(
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                check = _sendToServer();
                setState(() {
                  showSpinner = true;
                });
                if (check == 'ok') {
                  dynamic result =
                      await _auth.signInWithEmailAndPassword(email, password);
                  if (result == null) {
                    setState(() {
                      error = 'Could not sign in with those credentials';
                    });
                  } else {
                    showSpinner = false;
                    Navigator.pushNamed(context, Category.id);
                  }
                }
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      return "ok";
    } else {
      setState(() {
        _validate = true;
      });
      return "not ok";
    }
  }
}
