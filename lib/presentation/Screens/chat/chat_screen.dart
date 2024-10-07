import 'package:flutter/material.dart';
import 'package:primera_app_flutter/domain/entities/message.dart';
import 'package:primera_app_flutter/presentation/providers/chat_provider.dart';
import 'package:primera_app_flutter/presentation/widgets/chat/her_message_bubble.dart';
import 'package:primera_app_flutter/presentation/widgets/chat/my_message_bubble.dart';
import 'package:primera_app_flutter/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';


class ChatScreen extends StatelessWidget {
  
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(    //el inicio de todo
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://styles.redditmedia.com/t5_2e71zn/styles/communityIcon_zzv88v2qqyd41.jpeg?format=pjpg&s=aee8497b3ba768f66a375b8d31e6fa99fd0012bf'),
          ),
        ),
        title: const Text('LOVE ♥'),
        centerTitle: false,

      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();


    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [  
            Expanded(child: ListView.builder(
              itemCount: chatProvider.messageList.length, //cantidad de elementos filas en el listview
              itemBuilder: (context, index){
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers) ? 
                  const HerMessageBubble() : MyMessageBubble(message: message);
                
            })),
        
            //caja de texto para enviar mensaje
            MessageFieldBox(
              //onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
              ),
          ],
        ),
      ),
    );
  }
}