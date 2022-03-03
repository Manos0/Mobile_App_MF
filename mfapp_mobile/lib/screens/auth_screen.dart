import 'package:flutter/material.dart';
import 'package:mfapp_mobile/bin/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/auth.dart';
import '../screens/tabs_screen.dart';

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
                  padding: EdgeInsets.fromLTRB(32, 0, 32, 80),
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

  var _rememberMe = false;

  var _showPassword = false;

  Map<String, String> _authData = {
    'username': '',
    'password': '',
  };

  var _isLoading = false;

  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'User not found!',
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                child: Text(
                  'Try Again',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all(mfPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', _rememberMe);
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false)
          .login(_authData['username'], _authData['password']);
      //Na exeis to nou sou
      Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
    } catch (error) {
      const errorMessage = 'Please check your username and/or password.';
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
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
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    fillColor: mfPrimaryColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mfLightGrey,
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: mfLightGrey, width: 2.0),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
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
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.only(left: 36, right: 36),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(25, 18, 18, 18),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    fillColor: mfPrimaryColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mfLightGrey,
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: mfLightGrey, width: 2.0),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  // obscureText: true,
                  obscureText: !_showPassword,
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 80, left: 40),
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: CheckboxListTile(
                    activeColor: Theme.of(context).primaryColor,
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('Show password'),
                    value: _showPassword,
                    onChanged: (bool value) {
                      setState(() {
                        _showPassword = value;
                      });
                    },
                  ),
                ),
              ),
              if (_isLoading)
                CircularProgressIndicator()
              else
                Column(
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Login',
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(137, 15, 137, 15),
                        ),
                      ),
                      onPressed: _submit,
                    ),
                    Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: CheckboxListTile(
                        activeColor: Theme.of(context).primaryColor,
                        contentPadding: EdgeInsets.only(left: 40, top: 8),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Keep me signed in'),
                        value: _rememberMe,
                        onChanged: (bool value) async {
                          setState(() {
                            _rememberMe = value;
                          });
                        },
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ],
    );
  }
}
