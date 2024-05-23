import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  final Function()? onTap;
  final IconData iconData;
  const AppRoundedButton({super.key, this.onTap, required this.iconData});


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(56),
      child: InkWell(
       borderRadius: BorderRadius.circular(56), 
        onTap: onTap,
        child: SizedBox(
          width: 56,
          height: 56,
          child: Icon(
            iconData,
            ),
        ),
      ),
    );
  }
}