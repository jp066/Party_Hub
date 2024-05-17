import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sos_central/features/home/widgets/home_slider_item.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late final PageController _pageController;
  int _pageIndex = 0;
  List<dynamic> newsItems = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1000);
    fetchNews();
  }

  Future<void> fetchNews() async {
    final response = await http.get(
        Uri.parse('https://servicodados.ibge.gov.br/api/v3/noticias/?qtd=3'));

    if (response.statusCode == 200) {
      setState(() {
        newsItems = jsonDecode(response.body)['items'];
      });
    } else {
      throw Exception('Failed to load news');
    }
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
              _pageIndex = value % newsItems.length;
            });
          },
          controller: _pageController,
          itemCount: newsItems.length,
          itemBuilder: (context, index) {
            // Decodifique a string JSON para um objeto Dart
            Map<String, dynamic> imageObject =
                jsonDecode(newsItems[index]['imagens']);

            // Use a propriedade 'image_intro' como a URL da imagem
            String imageUrl = imageObject['image_intro'];

            return HomeSliderItem(
              isActive: _pageIndex == index,
              imageUrl: imageUrl,
              child: Image.network(imageUrl, errorBuilder: (BuildContext context,
                  Object exception, StackTrace? stackTrace) {
                return const Text('Algum erro ocorreu!');
              }),
            );
          },
        ),
      );
    }
}
