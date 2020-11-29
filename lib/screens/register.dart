import 'package:checkbox_formfield/checkbox_list_tile_formfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshmart/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  static const String id = 'Register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldkey = new GlobalKey<ScaffoldState>();
  final AuthService _auth = AuthService();
  bool showSpinner = false;
  String name, uname, email, password, address;
  String pno;
  bool enabled = false;
  bool checked = false;
  bool _validate = false;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text('Freshmart'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/register.jpg'),
                    radius: 90,
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Form(
                      key: _key,
                      autovalidate: _validate,
                      child: formUI(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: GestureDetector(
                        child: MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pushNamed(context, Login.id);
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
                ),
              ],
            )),
      ),
    ));
  }

  Widget formUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  border: OutlineInputBorder()),
              validator: validateName,
              onSaved: (String value) {
                name = value;
              }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder()),
            //validator: validateName,
            keyboardType: TextInputType.text,
            validator: validateUname,
            onSaved: (String value) {
              uname = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
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
              }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: TextFormField(
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                  labelText: 'Set Password',
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Contact',
                  prefixIcon: Icon(Icons.phone),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              validator: validateMobile,
              onSaved: (String value) {
                pno = value;
              }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Address',
                  prefixIcon: Icon(Icons.home),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  border: OutlineInputBorder()),
              validator: validateAddr,
              onSaved: (String value) {
                address = value;
              }),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              CheckboxListTileFormField(
                title: Text(
                  'I agree to the terms and conditions',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onSaved: (bool value) {
                  checked = value;
                },
                validator: (bool value) {
                  if (value == true) {
                    return null;
                  } else {
                    return 'Accept terms to proceed.';
                  }
                },
                activeColor: Colors.blue,
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: MaterialButton(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.blue,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    _sendToServer();

                    try {
                      final newUser = await _auth.registerWithEmailAndPassword(
                          email, password, name, uname, pno, address);
                      if (newUser != null) {
                        Navigator.pushNamed(context, Category.id);
                      }

                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String validateName(String value) {
    String pattern = r'(^[a-z A-Z]+$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Name is required.';
    } else if (!regExp.hasMatch(value)) {
      return 'Name must contain letters only.';
    }
    return null;
  }

  String validateAddr(String value) {
    if (value.length == 0) {
      return 'Address is required.';
    }
    return null;
  }

  String validateUname(String value) {
    String pattern = r'(^[a-zA-Z0-9.\_]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Username is required.';
    } else if (!regExp.hasMatch(value)) {
      return 'Username can contain letters,numbers, "_" only.';
    }
    return null;
  }

  String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Contact is required.';
    } else if (value.length != 10) {
      return 'Contact must contain exactly 10 digits.';
    } else if (!regExp.hasMatch(value)) {
      return 'Contact must contain digits only.';
    }
    return null;
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
