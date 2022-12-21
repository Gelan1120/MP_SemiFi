import 'package:flutter/material.dart';
import 'package:sfpracexam/httpservice.dart';
import 'package:sfpracexam/todo_edit.dart';
import 'package:sfpracexam/todo_model.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        leading: const Icon(Icons.list) ,
      ),
      body: FutureBuilder(
          future: httpService.getTodos(),
          builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot){

            if(snapshot.hasData){
              List<Todo>? todos = snapshot.data;

              return ListView(
                children: todos!
                    .map((Todo todos) => ListTile(
                  title: Text(todos.title),
                  subtitle: Text(todos.id.toString(),),

                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Todo_Edit(
                        todos: todos,
                      )
                      )
                  ),
                )).toList(),
              );
            }
            return const CircularProgressIndicator();
          }
      ),
    );
  }
}
