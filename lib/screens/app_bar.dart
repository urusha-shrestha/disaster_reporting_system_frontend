import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

AppBar buildAppBar({isDrawerOpen, onPressedOpen, onPressedClosed, title}) {
  return AppBar(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    backgroundColor: kprimaryColour,
    leading: isDrawerOpen
        ? IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: onPressedOpen,
            color: Colors.white,
          )
        : IconButton(
            icon: Icon(Icons.menu),
            onPressed: onPressedClosed,
            color: Colors.white,
          ),
    title: Text(title, style: TextStyle(color: Colors.white)),
  );
}

AppBar secondAppBar({title}) {
  return AppBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyle(color: Colors.grey),
    ),
  );
}
