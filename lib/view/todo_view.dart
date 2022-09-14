import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/bloc/get_todos/get_todos_bloc.dart';
import 'package:mobile_test/models/user_model.dart';
import 'package:mobile_test/view/user_view.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  void initState() {
    context.read<GetTodosBloc>().add(GetTodos(id: widget.userModel.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('todos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: BlocBuilder<GetTodosBloc, GetTodosState>(
          builder: (context, state) {
            if (state is GetTodosLoading) {
              return const ShimmerWidget();
            }
            if (state is GetTodosLoaded) {
              return ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  trailing: Icon(
                    state.todos[index].completed ? Icons.done : Icons.cancel,
                    color: state.todos[index].completed
                        ? Colors.green
                        : Colors.red,
                  ),
                  leading: CircleAvatar(
                      child: Text(state.todos[index].id.toString())),
                  title: Text(state.todos[index].title),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: state.todos.length,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
