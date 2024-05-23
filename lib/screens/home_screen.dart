import 'package:flutter/material.dart';
import 'package:sos_central/widgets/home/home_slider.dart';
import 'package:sos_central/screens/inserir_evento.dart';
import 'package:sos_central/screens/temperatura_screen.dart';
import 'package:sos_central/services/noticias_servico.dart'; // Importe o serviço de notícias
import 'package:sos_central/models/noticias_models.dart'; // Importe o modelo de artigos

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isTemperatureScreenVisible = false;
  double _opacity = 0.0;

  late Future<List<Article>> _newsFuture;

  void _toggleTemperatureScreen() {
    setState(() {
      _isTemperatureScreenVisible = !_isTemperatureScreenVisible;
      _opacity = _isTemperatureScreenVisible ? 1.0 : 0.0;
    });
  }

  @override
  void initState() {
    super.initState();
    _newsFuture = NewsService().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          TextButton(
            child: const Text('Tempo',
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Dm_sans',
                    fontWeight: FontWeight.bold)),
            onPressed: _toggleTemperatureScreen,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(20), // Define o raio da borda aqui
        ),
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HomeSlider(),
                    FutureBuilder<List<Article>>(
                      future: _newsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              final article = snapshot.data![index];
                                return Container(
                                  child: ListTile(
                                    title: Text(
                                      article.title,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      article.description,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Image.network(article.imageUrl),
                                  ),
                                );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('Erro ao carregar notícias');
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: _isTemperatureScreenVisible
                  ? Positioned.fill(
                      child: GestureDetector(
                        onTap: _toggleTemperatureScreen,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black54,
                          ),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: const TelaDeTemperatura(),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InserirAlerta()),
          );
        },
        child: const Icon(Icons.add, color: Colors.black, size: 25),
        shape: const CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 134, 2, 0),
      ),
    );
  }
}
