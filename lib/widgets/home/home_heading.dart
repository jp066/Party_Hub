import 'package:flutter/material.dart';

class HomeHeading extends StatelessWidget {
  final String title;
  final Widget ? trailing;
  const HomeHeading({Key ? key, required this.title, this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
      child: Row(
        children: [ 
        Text(title, style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        if (trailing != null) trailing!,
      ],
      ),
    );
  }
}