import 'dart:io';

import 'package:church_app/screens/update_email.dart';
import 'package:church_app/screens/update_name.dart';
import 'package:church_app/screens/update_password.dart';
import 'package:church_app/widgets/image_picker.dart';
import 'package:church_app/widgets/profile_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xff333560),
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Page App',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'GoogleSans'),
      home: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
    Navigator.of(context).pop();

  }

  String _userName = "Bukola Titilayo";
  String _email = "bukolatiti@gmail.com";

  void pushScreen(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }

  // callback to update name
  void updateFullName(String newName) {
    setState(() {
      _userName = newName;
    });
  }

  // callback to update email
  void updateEmail(String email) {
    setState(() {
      _email = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text("Profile"),
        backgroundColor: Color(0xff333560).withOpacity(.8),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/nodes.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              // showBottomSheet(
                              context: context,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              builder: ((BuildContext contex) {
                                return imagePickerDialog(context,
                                    getImageFromCamera, getImageFromGallery);
                              }));
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: _image == null
                                    ? AssetImage(
                                        "assets/images/dev_femi_crop.png",
                                      )
                                    : FileImage(_image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 50,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: IconButton(
                              icon: Icon(
                                Icons.photo_camera,
                                size: 16,
                                color: Color(0xff333560),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    // showBottomSheet(
                                    context: context,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    builder: ((BuildContext contex) {
                                      return imagePickerDialog(
                                          context,
                                          getImageFromCamera,
                                          getImageFromGallery);
                                    }));
                              }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    _userName,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "ACCOUNT",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          Column(
            children: ListTile.divideTiles(context: context, tiles: [
              CustomTile(
                icon: Icons.person,
                title: _userName,
                trailingText: "EDIT",
                onTap: () {
                  pushScreen(
                      context,
                      EditName(
                        fullName: _userName,
                        updateFunction: updateFullName,
                      ));
                },
              ),
              CustomTile(
                icon: Icons.mail_outline,
                title: _email,
                trailingText: "EDIT",
                onTap: () {
                  pushScreen(
                      context,
                      UpdateEmail(
                        email: _email,
                        updateFunction: updateEmail,
                      ));
                },
              ),
              CustomTile(
                icon: Icons.lock,
                title: "Change Password",
                trailingText: "Change",
                onTap: () {
                  pushScreen(context, UpdatePassword());
                },
              ),
              CustomTile(
                icon: Icons.notifications,
                title: "Notifications",
                trailingText: "ON/OFF",
                onTap: () {},
              ),
              logoutTile(),
            ]).toList(),
          )
        ],
      ),
    );
  }
}
