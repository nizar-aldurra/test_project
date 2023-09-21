import 'package:flutter/material.dart';

import '../widgets/add_post_form.dart';

class AddPostScreen extends StatelessWidget {
  static String routName = "add_post_screen";
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Post'),
          actions: [
            TextButton(
              onPressed: () {
                // Handle post submission here
                // You can add logic to send the post to your server or perform other actions
              },
              child: const Row(children: [
                Icon(Icons.post_add,color: Colors.white,),
                SizedBox(width: 3,),
                Text('Post',style:TextStyle(color: Colors.white),),
              ],),
            ),
          ],
        ),
      body: Container(
        child: SingleChildScrollView(
          child: AddPostForm(),
        ),
      ),
    );
  }
}