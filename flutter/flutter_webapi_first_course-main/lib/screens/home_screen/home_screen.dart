import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/logout.dart';
import 'package:flutter_webapi_first_course/screens/common/exception_dialog.dart';
import 'package:flutter_webapi_first_course/screens/home_screen/widgets/home_screen_list.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/journal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // O último dia apresentado na lista
  DateTime currentDay = DateTime.now();

  // Tamanho da lista
  int windowPage = 10;

  // A base de dados mostrada na lista
  Map<String, Journal> database = {};

  final ScrollController _listScrollController = ScrollController();

  JournalService service = JournalService();

  int? userId;

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título basado no dia atual
        title: Text(
          "${currentDay.day}  |  ${currentDay.month}  |  ${currentDay.year}",
        ),
        actions: [
          IconButton(
              onPressed: () {
                refresh();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: (userId != null)
          ? ListView(
              controller: _listScrollController,
              children: generateListJournalCards(
                  windowPage: windowPage,
                  currentDay: currentDay,
                  database: database,
                  refresh: refresh,
                  userId: userId!),
            )
          : const Center(child: CircularProgressIndicator()),
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            onTap: () {
              logout();
            },
            title: const Text(
              "Sair",
            ),
            leading: const Icon(Icons.logout),
          )
        ],
      )),
    );
  }

  void refresh() {
    SharedPreferences.getInstance().then((prefs) {
      int? id = prefs.getInt("id");
      if (id != null) {
        setState(() {
          userId = id;
        });
        service.getAll(id: id).then((List<Journal> listJournals) {
          setState(() {
            database = {};

            for (Journal journal in listJournals) {
              database[journal.id] = journal;
            }
          });
        });
      } else {
        Navigator.pushReplacementNamed(context, "login");
      }
    }).catchError(
      (error) {
        var innerError = error as HttpException;
        showExceptionDialog(context, content: innerError.message);
      },
      test: (error) => error is HttpException,
    );
  }
}
