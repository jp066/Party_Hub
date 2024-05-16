import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static List<String> estados = [
    'Acre',
    'Alagoas',
    'Amapá',
    'Amazonas',
    'Bahia',
    'Ceará',
    'Distrito Federal',
    'Espírito Santo',
    'Goiás',
    'Maranhão',
    'Mato Grosso',
    'Mato Grosso do Sul',
    'Minas Gerais',
    'Pará',
    'Paraíba',
    'Paraná',
    'Pernambuco',
    'Piauí',
    'Rio de Janeiro',
    'Rio Grande do Norte',
    'Rio Grande do Sul',
    'Rondônia',
    'Roraima',
    'Santa Catarina',
    'São Paulo',
    'Sergipe',
    'Tocantins',
  ];
  void updateSearch(String value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 50, 47)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: const TextStyle(fontFamily: 'Dm_sans', fontSize: 16.0),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Pesquise por serviços ou por alertas',
                hintStyle: const TextStyle(fontFamily: 'Dm_sans', fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
                prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 255, 50, 47)),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: estados.length, // Adicione esta linha
                itemBuilder: (context, index) => ListTile(
                  title: Text(estados[index],
                      style: const TextStyle(
                          fontFamily: 'Dm_sans',
                          fontSize: 19.0,
                          color: Color.fromARGB(255, 255, 50, 47))),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
