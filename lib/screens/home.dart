import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  addData() async {
    // _firestore
    //     .collection("${_auth.currentUser!.uid}")
    //     .add({"name": nameController.text, "task": taskController.text});

    //Nested Collection
    _firestore
        .collection("User Data")
        .doc('Task Data')
        .collection("${_auth.currentUser!.uid}")
        .add({"name": nameController.text, "task": taskController.text});
    nameController.clear();
    taskController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextFormField(
              controller: taskController,
              decoration: InputDecoration(labelText: "Task"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  onPressed: () {
                    addData();
                  },
                  child: Text("Add Task")),
            )
          ]),
    );
  }
}
