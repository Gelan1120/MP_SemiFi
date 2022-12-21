import 'package:flutter/material.dart';
import 'package:sfpracexam/httpservice.dart';
import 'package:sfpracexam/todo_model.dart';

class Todo_Edit extends StatefulWidget {

  final Todo todos;

  const Todo_Edit({
    required this.todos,
    Key? key}) : super(key: key);

  @override
  State<Todo_Edit> createState() => _Todo_EditState();
}

class _Todo_EditState extends State<Todo_Edit> {

  var formKey = GlobalKey<FormState>();

  TextEditingController id = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController completed = TextEditingController();

  late HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Details'),
      ),

      body: FutureBuilder(
          future: httpService.getTodos(),
          builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot){

            if(snapshot.hasData){
              List<Todo>? todos = snapshot.data;

              return ListView(
                children: todos!
                    .map((Todo todos) => Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: title,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                labelText: todos.title,
                                hintText: 'Todos'
                            ),
                            validator: (value) {
                              return (value == '') ? "Please enter a value": null;
                            },
                          ),
                          TextFormField(
                            controller: id,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                labelText: todos.id.toString(),
                                hintText: 'Id'
                            ),
                            validator: (value) {
                              return (value == '') ? "Please enter a value": null;
                            },
                          ),
                          TextFormField(
                            controller: completed,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                labelText: todos.completed.toString(),
                                hintText: 'Completed'
                            ),
                            validator: (value) {
                              return (value == '') ? "Please enter a value": null;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                httpService = httpService.putTodo(title.text) as HttpService;
                              });
                            },
                            child: const Text('Update Data'),
                          ),
                        ],
                      ),
                    )
                )
                ).toList(),
              );

            }

            return const CircularProgressIndicator();
          }
      )
    );
  }
}
