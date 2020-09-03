import 'package:church_app/constants.dart';
import 'package:flutter/material.dart';

class UpdateEmail extends StatefulWidget {
  final Function updateFunction;
  final String email;

  const UpdateEmail({Key key, this.updateFunction, this.email})
      : super(key: key);
  @override
  _UpdateEmailState createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // populate textfield with previous email
    _emailController.text = widget.email;
  }

  @override
  void dispose() {
    // dispose controller
    super.dispose();
    _emailController.dispose();
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
                Icons.mail,
                size: 70,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Change Email Address"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: TextFormField(
                  controller: _emailController,
                  // autovalidate: true,
                  validator: (value) {
                    if (!emailValidatorRegExp.hasMatch(value)) {
                      return emailNullError;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Email Adrdress",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      )),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        widget.updateFunction(_emailController.text);
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
