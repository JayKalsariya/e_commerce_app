import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class firstPage extends StatelessWidget {
  const firstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffaf98fa),
          body: Container(
            // height: double.infinity,
            // width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Logo.png"),
                alignment: Alignment.center,
                fit: BoxFit.cover,
                // scale: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
