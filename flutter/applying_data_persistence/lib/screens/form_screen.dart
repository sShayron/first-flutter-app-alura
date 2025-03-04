import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/default_app_bar.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController pictureController = TextEditingController();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    }

    if (int.parse(value) > 5 || int.parse(value) < 1) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: DefaultAppBar(title: 'Nova Tarefa'),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                height: 650,
                width: 375,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 3)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (valueValidator(value)) {
                            return 'Insira o nome da tarefa';
                          }
                          return null;
                        },
                        controller: nameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nome',
                            fillColor: Colors.white70,
                            filled: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (difficultyValidator(value)) {
                            return 'Insira uma dificuldade entre 1 e 5';
                          }
                          return null;
                        },
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Dificuldade',
                            fillColor: Colors.white70,
                            filled: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (valueValidator(value)) {
                            return 'Insira um URL de imagem';
                          }
                          return null;
                        },
                        controller: pictureController,
                        onChanged: (text) {
                          setState(() {});
                        },
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.url,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Imagem',
                            fillColor: Colors.white70,
                            filled: true),
                      ),
                    ),
                    Container(
                        height: 100,
                        width: 72,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            pictureController.text,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                  'assets/images/no-picture.webp');
                            },
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            TaskInherited.of(context).newTask(
                                nameController.text,
                                pictureController.text,
                                int.parse(difficultyController.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Tarefa adicionada'),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Adicionar'))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
