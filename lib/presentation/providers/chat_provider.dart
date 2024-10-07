import 'package:flutter/material.dart';
import 'package:primera_app_flutter/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> messageList = [
    Message(text: 'Hola Amor', fromWho: FromWho.me),
    Message(text: 'Ya estas en casa?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    
    final newMessage = Message(text: text , fromWho: FromWho.me);
    messageList.add(newMessage);
    
    notifyListeners();
  }


}