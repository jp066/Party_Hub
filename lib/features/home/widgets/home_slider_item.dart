import 'package:flutter/material.dart';

class HomeSliderItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  const HomeSliderItem({
    Key? key,
    required this.isActive,
    required this.imageUrl,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.08,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 400),
        scale: isActive ? 1 : 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              Container(
                color: Color.fromARGB(255, 172, 114, 26),
              ),
              Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}