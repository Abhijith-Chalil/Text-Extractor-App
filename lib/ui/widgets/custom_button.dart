// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final String buttonName;
  final IconData icon;
  final Size buttonSize;
  final double? iconSize;
 final VoidCallback? onTap;
  CustomeButton(
      {Key? key,
      required this.buttonName,
      required this.icon,
      required this.buttonSize,
      this.onTap,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonSize.width,
        height: buttonSize.height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 25),
                blurRadius: 3,
                spreadRadius: -10)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize ?? 60,
            ),
            Text(
              buttonName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
