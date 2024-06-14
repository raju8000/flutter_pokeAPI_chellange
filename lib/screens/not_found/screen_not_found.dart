import 'package:flutter/material.dart';
import 'package:pokemon_challenge/config/string_constant.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(Strings.screenNotFound, style: TextStyle(fontSize: 41),),
      ),
    );
  }
}