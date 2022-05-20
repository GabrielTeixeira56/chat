// ignore_for_file: unused_local_variable, unnecessary_cast
import 'dart:io';

import 'package:chat/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:storage_manager/storage_manager.dart';

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Future<void> _sendMessage({String? text, File? imgFile}) async {
    if (imgFile != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(imgFile) as UploadTask;

      // await TaskSnapshot task;
      // String url = TaskSnapshot.ref.getDownloadURL();
    }

    FirebaseFirestore.instance.collection('Mensagem').add({
      'Text': text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TESTE'),
        elevation: 0,
      ),
      body: TextComposer(_sendMessage),
    );
  }
}
