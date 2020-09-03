import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String trailingText;
  final IconData icon;
  final Function onTap;

  const CustomTile(
      {Key key, this.title, this.trailingText, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: InkWell(
        onTap: onTap,
        child: Text(
          trailingText,
          style: TextStyle(
            color: Color(0xff53557d),
          ),
        ),
      ),
    );
  }
}

Widget logoutTile() {
  return ListTile(
    leading: Icon(
      Icons.exit_to_app,
      color: Color(0xff191c52),
    ),
    title: Text(
      "Log Out",
      style: TextStyle(
        color: Color(0xff191c52),
      ),
    ),
  );
}
