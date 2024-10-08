import 'package:flutter/material.dart';


class MessageFieldBox extends StatefulWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});


  @override
  MessageFieldBoxState createState() => MessageFieldBoxState();
}

class MessageFieldBoxState extends State<MessageFieldBox> {
  
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Escribe tu mensaje..',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          if (textValue.isNotEmpty) {
            widget.onValue(textValue);
            textController.clear(); // Limpia el campo
            focusNode.requestFocus(); // Mantiene el foco en el campo de texto
          }
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {
          widget.onValue(value);
          textController.clear(); // Limpia el campo
          focusNode.requestFocus(); // Mantiene el foco en el campo de texto
        }
      },
    );
  }
}