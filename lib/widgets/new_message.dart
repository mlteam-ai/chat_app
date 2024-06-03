import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;
    if (enteredMessage.trim().isEmpty) {
      return;
    }

    _messageController.clear();
    FocusScope.of(context).unfocus();

    final userId = FirebaseAuth.instance.currentUser!.uid;
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (!userData.exists) {
      return;
    }

    FirebaseFirestore.instance.collection('chat').add(
      {
        'text': enteredMessage,
        'createdAt': Timestamp.now(),
        'userId': userId,
        'username': userData.data()!['username'],
        'userImage': userData.data()!['image_url'],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: const InputDecoration(labelText: 'Send a message...'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _submitMessage,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
