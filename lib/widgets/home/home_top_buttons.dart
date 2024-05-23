import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTopButtons extends StatelessWidget {
   HomeTopButtons ({Key ? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
      children: [
         Spacer(),
          SizedBox(
          width: 10,
        ),
      ],
      ),
    );
  }
}