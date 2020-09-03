import 'package:church_app/constants.dart';
import 'package:flutter/material.dart';

class UpdatePassword extends StatefulWidget {
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final String password = "123456";

  @override
  void initState() {
    super.initState();
    // populate textfield with previous email
    _passwordController.text = password;
  }

  @override
  void dispose() {
    // dispose controller
    super.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Edit Profile"),
        backgroundColor: Color(0xff333560).withOpacity(.8),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 70.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 70,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Change Your Password"),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return passNullError;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter Current Password",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return passNullError;
                  }
                  if (value.length < 6) {
                    return shortPassError;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter New Password",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              TextFormField(
                controller: _repeatPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return passNullError;
                  }
                  if (value != _newPasswordController.text) {
                    return matchPassError;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Confirm New Password",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.of(context).pop();
                      }
                    },
                    color: Color(0xff191c52),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
