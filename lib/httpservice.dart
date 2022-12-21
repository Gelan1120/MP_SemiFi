import 'dart:convert';
import 'package:http/http.dart';
import 'package:sfpracexam/todo_model.dart';

class HttpService{

  final String todosUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Todo>> getTodos() async{

    Response res = await get(Uri.parse(todosUrl));

    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);

      List<Todo> todos = body.map((dynamic item) => Todo.fromJson(item)).toList();

      return todos;
    } else {
      throw "Can't get todos";
    }

  }

  Future<Todo> putTodo(String title) async {
    final Response response = await put(Uri.parse('https://jsonplaceholder.typicode.com/todos/id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update todo.');
    }
  }






}