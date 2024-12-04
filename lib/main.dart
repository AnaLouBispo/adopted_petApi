//import 'package:first_app/view/homepage.dart';
import 'package:adopted_pet/view/add_pet.dart';
import 'package:adopted_pet/view/favorite.dart';
import 'package:adopted_pet/view/home.dart';
import 'package:adopted_pet/view/login.dart';
import 'package:adopted_pet/view/pet_info.dart';
import 'package:adopted_pet/view/register.dart';
import 'package:adopted_pet/view/user_profile.dart';
import 'package:adopted_pet/widget/cardPet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}
