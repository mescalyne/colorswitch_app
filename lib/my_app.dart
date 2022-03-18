import 'package:colorswitch_app/home/bloc/home_screen_bloc.dart';
import 'package:colorswitch_app/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// MyApp main widget
class MyApp extends StatelessWidget {
  /// constructor
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: BlocProvider(
          create: (BuildContext context) => HomeScreenBloc(),
          child: const HomeScreen(),
        ),);
  }
}
