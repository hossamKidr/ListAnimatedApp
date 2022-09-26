import 'package:flutter/material.dart';

import '../list_animatede/list_animatede.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Animated',
      home: ListAnimatede(),
    );
  }
}
