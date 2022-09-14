import 'package:flutter/material.dart';
import 'package:mobile_test/services/api_service.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _bodyController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    super.initState();
  }

  addNewPost() async {
    await ApiService().addNewPost();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _bodyController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Post')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Title'),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title can\'t be empty';
                  }
                  if (value.length < 8) {
                    return 'Title must have 8 or more characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text('Body'),
              TextFormField(
                maxLines: 5,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Body can\'t be empty';
                  }
                  if (value.length < 8) {
                    return 'Body must have 8 or more characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    addNewPost();
                  }
                },
                height: 58,
                minWidth: double.infinity,
                color: Colors.blue,
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
