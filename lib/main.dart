import 'package:flutter/material.dart';
import 'package:primera_app_flutter/config/app_theme.dart';
import 'package:primera_app_flutter/presentation/Screens/chat/chat_screen.dart';
import 'package:primera_app_flutter/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Primera App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectColor: 0).theme(),
        home: const ChatScreen()
      ),
    );
  }
}