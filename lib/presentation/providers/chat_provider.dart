import 'package:flutter/material.dart';
import 'package:primera_app_flutter/domain/entities/message.dart';
import 'package:primera_app_flutter/domain/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();


  List<Message> messageList = [
    Message(text: 'Hola Amor', fromWho: FromWho.me),
    Message(text: 'Ya estas en casa?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;

    final newMessage = Message(text: text , fromWho: FromWho.me);
    messageList.add(newMessage);

     if( text.endsWith('?')){
      await herReply();
     }
    
    notifyListeners();
    moveScrollToBottom();
  }
  
  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();

  }

  Future<void> moveScrollToBottom() async{

    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    
    );

  }




}