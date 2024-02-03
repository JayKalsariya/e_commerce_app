import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'view/screens/Home_page.dart';

void main() {
  runApp(
    const My_app(),
  );
}

class My_app extends StatelessWidget {
  const My_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
