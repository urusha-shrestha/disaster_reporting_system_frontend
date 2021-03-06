import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  MenuItems({@required this.icon, @required this.label, @required this.onTap});
  final IconData icon;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Icon(
            icon,
            size: 20.0,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            label,
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
