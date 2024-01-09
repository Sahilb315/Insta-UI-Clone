import 'package:flutter/material.dart';
import 'package:insta_ui_clone/pages/home.page.dart';
import 'package:insta_ui_clone/provider/navigation_page_provider.dart';
import 'package:insta_ui_clone/provider/post_provider.dart';
import 'package:insta_ui_clone/provider/search_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => NavigationPageProvider()),
        ChangeNotifierProvider(create: (_) => PostsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
