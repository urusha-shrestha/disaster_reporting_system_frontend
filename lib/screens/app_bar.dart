import 'package:flutter/material.dart';

import '../constants.dart';

AppBar buildAppBar({isDrawerOpen, onPressedOpen, onPressedClosed, title}) {
  return AppBar(
    backgroundColor: kprimaryColour,
    leading: isDrawerOpen
        ? IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: onPressedOpen)
        : IconButton(icon: Icon(Icons.menu), onPressed: onPressedClosed),
    title: Text(title),
  );
}
