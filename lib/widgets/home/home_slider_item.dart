import 'package:flutter/material.dart';

class HomeSliderItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  const HomeSliderItem({
    super.key,
    required this.isActive,
    required this.imageUrl, required Image child,
  });


  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.08,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 400),
        scale: isActive ? 1.0 : 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              Container(
                color: Colors.black,
              ),
                Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                ),
            ],
          ),
        ),
      ),
    );
  }
}