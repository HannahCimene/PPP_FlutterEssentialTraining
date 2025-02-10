import 'package:chat/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;

  ChatInput({super.key, required this.onSubmit});

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print('Chatmessage: ${chatMessageController.text}');

    final newChatMessage = ChatMessageEntity(
        text: chatMessageController.text,
        id: '244',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        //deze moet normaal [context.read<AuthService>().getUserName()] zijn maar doordat de context niet is meegegeven heb ik dit gehardcode
        author: Author(userName: 'HannahCimene'));

    onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text('Hello!'),
                      );
                    });
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
          Expanded(
              child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            controller: chatMessageController,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: 'Type your message',
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none),
          )),
          IconButton(
              onPressed: onSendButtonPressed,
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
