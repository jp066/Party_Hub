import 'package:flutter/material.dart';
import 'package:sos_central/services/noticias_servico.dart';
import 'package:sos_central/models/noticias_models.dart';
import 'package:sos_central/features/home/widgets/home_slider_item.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late final PageController _pageController;
  int _pageIndex = 0;
  List<Article> newsItems = [];
  final newsService = NewsService();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1000);
    fetchNewsItems();
  }

  Future<void> fetchNewsItems() async {
    try {
      newsItems = await newsService.fetchNews();
      setState(() {});
    } catch (e) {
      print('Failed to load news: $e');
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
        itemCount: newsItems.length > 2 ? 4 : newsItems.length,
        itemBuilder: (context, index) {
          var imageUrl = newsItems[index].imageUrl;
          if (imageUrl.isEmpty) {
            return HomeSliderItem(
              isActive: _pageIndex == index,
              imageUrl: imageUrl,
              child: Image.asset('assets/icons/Ingresse_logo.png'),
            );
          } else {
            return HomeSliderItem(
              isActive: _pageIndex == index,
              imageUrl: imageUrl,
              child: Image.network(imageUrl, errorBuilder:
                  (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                return const Text('Algum erro ocorreu ao carregar a imagem!');
              }),
            );
          }
        },
      ),
    );
  }
}
