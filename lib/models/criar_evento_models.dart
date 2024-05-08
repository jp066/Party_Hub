
class Event {
  String name;
  DateTime date;
  String location;

  Event({required this.name, required this.date, required this.location});

  @override
  String toString() {
    return 'Event{name: $name, date: $date, location: $location}';
  }
}
class CriarEventoLogic {
  void criarEvento(String nome, DateTime data, String local) {
    Event evento = Event(name: nome, date: data, location: local);

    // Faça qualquer processamento adicional necessário, como salvar o evento em um banco de dados

    // Exiba uma mensagem de sucesso
    print('Evento criado com sucesso: $evento');
  }
}

void main() {
  CriarEventoLogic criarEventoLogic = CriarEventoLogic();
  criarEventoLogic.criarEvento('Festa de Aniversário', DateTime.now(), 'Casa do João');
}