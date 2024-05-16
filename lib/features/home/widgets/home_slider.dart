import 'package:flutter/material.dart';
import 'package:sos_central/features/home/widgets/home_slider_item.dart';
import 'package:sos_central/theme/dummy.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => __HomeSliderState();
}

class __HomeSliderState extends State<HomeSlider> {
  late final PageController _pageController;

  int _pageIndex = 0;


  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1000);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
        super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            _pageIndex = value % newsrItems.length;
          });

        },
        controller: _pageController, 
        itemBuilder: (context, index) {
          final i = index % newsrItems.length;
         return HomeSliderItem(
          isActive: _pageIndex == i,
          imageAssetPath: newsrItems[i]['imageAssetPath']!,
         );
        },    
       
    ),
    );
  }
}