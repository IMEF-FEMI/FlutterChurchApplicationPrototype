import 'package:church_app/constants.dart';
import 'package:flutter/material.dart';

class EditName extends StatefulWidget {
  final Function updateFunction;
  final String fullName;

  const EditName({Key key, this.updateFunction, this.fullName})
      : super(key: key);
  @override
  _EditNameState createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  TextEditingController _fullNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // populate textfield with previous name
    _fullNameController.text = widget.fullName;
  }

  @override
  void dispose() {
    // dispose controller
    super.dispose();
    _fullNameController.dispose();
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
                Icons.person,
                size: 70,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Change Personal Information"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: TextFormField(
                  controller: _fullNameController,
                  // autovalidate: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return nameNullError;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Full Name",
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
                        widget.updateFunction(_fullNameController.text);
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
