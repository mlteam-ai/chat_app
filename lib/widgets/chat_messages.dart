import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (ctx, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No messages yet!'),
            );
          }
          if (chatSnapshot.hasError) {
            return const Center(
              child: Text('An error occurred!'),
            );
          }
          final chatDocs = chatSnapshot.data!.docs;
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (ctx, index) {
              final currentMessage = chatDocs[index].data();
              final nextMessage = (index == chatDocs.length - 1)
                  ? null
                  : chatDocs[index + 1].data();

              final currentMessageUserId = currentMessage['userId'];
              final nextMessageUserId =
                  nextMessage != null ? nextMessage['userId'] : null;
              final nextUserIsSame = nextMessageUserId == currentMessageUserId;

              return (!nextUserIsSame)
                  ? MessageBubble.first(
                      userImage: currentMessage['userImage'],
                      username: currentMessage['username'],
                      message: currentMessage['text'],
                      isMe: currentMessage['userId'] == authenticatedUser.uid,
                    )
                  : MessageBubble.next(
                      message: currentMessage['text'],
                      isMe: currentMessage['userId'] == authenticatedUser.uid,
                    );

              /*
              return ListTile(
                title: Text(chatDocs[index]['text']),
                subtitle: Text(chatDocs[index]['username']),
                trailing: chatDocs[index]['userImage'] != null
                    ? CircleAvatar(
                        backgroundImage:
                            NetworkImage(chatDocs[index]['userImage']),
                      )
                    : const Icon(Icons.account_circle),
              );*/
            },
          );
        });
  }
}
