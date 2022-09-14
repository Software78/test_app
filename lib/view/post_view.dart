import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/models/user_model.dart';
import 'package:mobile_test/view/user_view.dart';

import '../bloc/get_posts/get_posts_bloc.dart';

class PostView extends StatefulWidget {
  const PostView({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    context.read<GetPostsBloc>().add(GetPosts(id: widget.userModel.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: BlocBuilder<GetPostsBloc, GetPostsState>(
          builder: (context, state) {
            if (state is GetPostsLoading) {
              return const ShimmerWidget();
            }
            if (state is GetPostsLoaded) {
              return ListView.separated(
                itemBuilder: (context, index) => ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  title: Text(state.posts[index].title),
                  children: <Widget>[
                    ListTile(title: Text(state.posts[index].body)),
                    ListTile(title: Text(state.posts[index].id.toString())),
                  ],
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemCount: state.posts.length,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
