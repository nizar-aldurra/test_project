import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maaly_alkhayr_test_project/blocs/posts/posts_bloc.dart';
import 'package:maaly_alkhayr_test_project/models/post.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddPostForm extends StatelessWidget {
  AddPostForm({super.key});

  final _formKey = GlobalKey<FormState>();
  String? errorMessage;
  Post newPost = Post();
  @override
  Widget build(BuildContext context) {
    return BlocListener<PostsBloc, PostsState>(
      listener: (context, state) {
        if (state is PostLoadedState) {
          Navigator.of(context).pop();
        }
        if (state is PostErrorState) {
          errorMessage = state.error;
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              errorMessage == null
                  ? const SizedBox()
                  : Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
              TextFormField(
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'post',
                  isDense: true,
                ),
                validator: (value) {
                  if (value!.isEmpty && newPost.media == null) {
                    return "please fill the post description";
                  }
                  return null;
                },
                onChanged: (value) {
                  newPost.content = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    selectImages();
                        // .then(
                        //     (value) => _addPostBloc.add(ImagesPostChanged(value)));
                  },
                  child: const Text('select images')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // _addPostBloc.add(AddPostButtonPressed());
                    }
                  },
                  child: const Text('Add')),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<XFile>> selectImages() async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    List<XFile> resultList = [];
    try {
      resultList = await ImagePicker().pickMultiImage();

    } catch (e) {
      print(e.toString());
    }
    return resultList;
  }
}
