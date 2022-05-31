import 'package:flutter/material.dart';
import 'package:tcc_mireli/screens/tela03.dart';
import 'utils/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO alterar home
    return MaterialApp(
      title: "TCC",
      debugShowCheckedModeBanner: false,
      home: Tela03(),
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(
            HexColor("#5F5B5B"),
          ),
        ),
      ),
    );
  }
}
