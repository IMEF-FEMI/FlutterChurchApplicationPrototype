import 'package:flutter/material.dart';

Widget imagePickerDialog(BuildContext context, Function getFromCamera, Function getFromGallery) {
  return Container(
      decoration: BoxDecoration(
          color: Color(0xff191c52),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      // color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile Photo",
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop())
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                imagePickerOption("Camera", getFromCamera, Icons.camera_enhance),
                SizedBox(width: 40,),
                imagePickerOption("Gallery", getFromGallery, Icons.image),
              ],
            )
          ],
        ),
      ));
}

Widget imagePickerOption(String subtitle, Function onTap, IconData icon) {
  return Column(
    children: [
      CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        child: IconButton(
            iconSize: 25,
            icon: Icon(
              icon,
              color: Color(0xff232545),
            ),
            onPressed: onTap),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        subtitle,
        style: TextStyle(color: Colors.white, fontSize: 10),
      )
    ],
  );
}
