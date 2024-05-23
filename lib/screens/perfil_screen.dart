import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos_central/services/autenticador.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final autenticacaoServico = Provider.of<AutenticacaoServico>(context);
    final String email =
        autenticacaoServico.usuario?.email ?? 'Usuário não logado';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 20, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Text(email,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontFamily: 'Dm_sans',
                  )),
            ],
          ),
          bottom: const TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'ALERTAS CRIADOS'),
              Tab(text: 'NOTICIAS SALVAS'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
    Center(
      child: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('events').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Algo deu errado');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Carregando...", style: TextStyle(color: Colors.white));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return Card(
                child: ListTile(
                  title: Text(data['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Data: ${data['date'].toDate().day}/${data['date'].toDate().month}/${data['date'].toDate().year}'),
                      Text('Hora: ${data['time']}'),
                      Text('CEP: ${data['location']}'),
                      Text(data['description']),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    ),
                  Center(child: Text('Conteúdo das notícias salvas')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
