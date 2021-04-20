import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(32, 0, 32, 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/images/MF-Logo-H.png',
                    width: 349,
                    height: 92,
                  ),
                ),
              ),
              Container(
                child: AuthCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  var _checked = false;

  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'username': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.Login) {
      // Log user in
      await Provider.of<Auth>(context, listen: false)
          .login(_authData['username'], _authData['password']);
    } else {
      // Sign user up
      await Provider.of<Auth>(context, listen: false)
          .signup(_authData['username'], _authData['password']);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 25),
                padding: EdgeInsets.only(left: 36, right: 36),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(25, 18, 18, 18),
                    labelText: 'Email or Username',
                    labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(175, 178, 188, 0.20),
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(240, 240, 240, 1),
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Invalid email or username!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['username'] = value;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 36, right: 36),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(25, 18, 18, 18),
                    labelText: 'Password',
                    labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(175, 178, 188, 0.20),
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(240, 240, 240, 1),
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40),
                      ),
                    ),
                  ),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35, bottom: 30),
                child: CheckboxListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                  activeColor: Theme.of(context).primaryColor,
                  contentPadding: EdgeInsets.only(left: 40),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Keep me signed in'),
                  value: _checked,
                  onChanged: (bool value) {
                    setState(() {
                      _checked = value;
                    });
                  },
                ),
              ),
              if (_isLoading)
                CircularProgressIndicator()
              else
                ElevatedButton(
                  child: Text(
                    _authMode == AuthMode.Login ? 'Login' : 'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(0, 219, 176, 1),
                    ),
                    elevation: MaterialStateProperty.all(8),
                    shadowColor: MaterialStateProperty.all(
                      Color.fromRGBO(0, 219, 176, 1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(137, 15, 137, 15)),
                  ),
                  onPressed: _submit,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
