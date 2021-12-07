import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarByName extends StatelessWidget {
  final double diameter;
  final String initialsName;

  const AvatarByName({required Key key, this.diameter = 50, this.initialsName = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(diameter),
          border: Border.all(width: 2.0, color: Colors.grey)),
      child: Text(initialsName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 0.36 * diameter)),
    );
  }
}
