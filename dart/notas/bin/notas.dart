import 'dart:io';

void main() {
  List<String> notes = [];
  menu(notes);
}

String getCommand() {
  print("Digite um comando: 1 - Adicionar nota, 2 - Listar notas, 3 - Sair");
  List<String> commands = ["1", "2", "3"];
  String? command = "";

  command = stdin.readLineSync();

  if (command == null || !commands.contains(command)) {
    print("Comando inválido");
    getCommand();
  }

  return command!;
}

List<String> addNote(List<String> notes) {
  print("Digite a nota:");
  String? note = stdin.readLineSync();

  if (note == null || note.isEmpty) {
    print("Nota inválida");
    addNote(notes);
  }

  notes.add(note!);

  return notes;
}

void listNotes(List<String> notes) {
  if (notes.isEmpty) {
    print("Nenhuma nota cadastrada");
  } else {
    for (var note in notes) {
      print(note);
    }
  }
}

void menu(List<String> notes) {
  print("");
  header();
  print("");
  print("");
  String cmd = getCommand();
  print("");

  switch (cmd) {
    case "1":
      addNote(notes);
      menu(notes);
      break;
    case "2":
      listNotes(notes);
      menu(notes);
      break;
    case "3":
      print("Saindo...");
      break;
  }
}

void header() {
  print(" ███▄    █  ▒█████  ▄▄▄█████▓ ▄▄▄        ██████ ");
  print(" ██ ▀█   █ ▒██▒  ██▒▓  ██▒ ▓▒▒████▄    ▒██    ▒ ");
  print("▓██  ▀█ ██▒▒██░  ██▒▒ ▓██░ ▒░▒██  ▀█▄  ░ ▓██▄   ");
  print("▓██▒  ▐▌██▒▒██   ██░░ ▓██▓ ░ ░██▄▄▄▄██   ▒   ██▒");
  print("▒██░   ▓██░░ ████▓▒░  ▒██▒ ░  ▓█   ▓██▒▒██████▒▒");
  print("░ ▒░   ▒ ▒ ░ ▒░▒░▒░   ▒ ░░    ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░");
  print("░ ░░   ░ ▒░  ░ ▒ ▒░     ░      ▒   ▒▒ ░░ ░▒  ░ ░");
  print("   ░   ░ ░ ░ ░ ░ ▒    ░        ░   ▒   ░  ░  ░  ");
  print("         ░     ░ ░                 ░  ░      ░  ");
  print("                                                ");
}
