import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/models/user_model.dart';
import 'package:mobile_test/view/add_post_view.dart';
import 'package:mobile_test/view/post_view.dart';
import 'package:mobile_test/view/todo_view.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/get_users/get_users_bloc.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  void initState() {
    context.read<GetUsersBloc>().add(GetUsers());
    super.initState();
  }

  navigateToTodos(UserModel model) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TodoView(userModel: model)));
  }

  navigateToPosts(UserModel model) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PostView(userModel: model)));
  }

  navigateToAddPost() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddPostView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<GetUsersBloc, GetUsersState>(
          builder: (context, state) {
            if (state is GetUsersLoading) {
              return const ShimmerWidget();
            }
            if (state is GetUsersLoaded) {
              return ListView.separated(
                itemBuilder: (context, index) => ExpansionTile(
                  title: Text(state.users[index].username),
                  subtitle: Text(state.users[index].name),
                  children: <Widget>[
                    ListTile(title: Text('Email: ${state.users[index].email}')),
                    ListTile(
                        title: Text(
                            'Address: ${state.users[index].address!.street}')),
                    ListTile(title: Text('Phone: ${state.users[index].phone}')),
                    GestureDetector(
                        onTap: () => navigateToTodos(state.users[index]),
                        child: const ListTile(title: Text('Todos'))),
                    GestureDetector(
                        onTap: () => navigateToPosts(state.users[index]),
                        child: const ListTile(title: Text('Posts'))),
                  ],
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemCount: state.users.length,
              );
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToAddPost(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class UserWidget extends StatelessWidget {
//   const UserWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(
//         child: Text(state.users[index].id.toString()),
//       ),
//       title: Text(state.users[index].username),
//       subtitle: Text(state.users[index].name),
//     );
//   }
// }

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
