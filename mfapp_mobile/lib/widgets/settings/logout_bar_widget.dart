import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bin/colors.dart';
import '../../providers/auth.dart';
import '../../screens/auth_screen.dart';

class LogoutBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Material(
                  color: mfPrimaryColor,
                  child: InkWell(
                    splashColor: mfPrimaryColor40,
                    onTap: () {
                      Provider.of<Auth>(context, listen: false).logout();
                      Navigator.of(context)
                          .pushReplacementNamed(AuthScreen.routeName);
                    },
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Logout',
                style: TextStyle(
                  color: mfPrimaryColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
