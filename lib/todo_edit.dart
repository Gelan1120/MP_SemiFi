import 'package:flutter/material.dart';
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

  late final TextEditingController _controller = TextEditingController(text: widget.todos.title);
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Update'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Todo Title",
                  ),
                  validator: (value) {
                    return value == null || value.isEmpty ?
                    "Input todo" : null;
                  },
                ),
              ),
              const SizedBox(height: 80),
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var updateTodo = Todo(
                            id: widget.todos.id,
                            userId: widget.todos.userId,
                            title: _controller.text,
                            completed: widget.todos.completed
                        );

                        Navigator.pop(context, updateTodo);
                      }
                    },
                    child: const Text("Update Task")
                ),
              )
            ],
          ),
        ),
      ),
      );
  }
}

