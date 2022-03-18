import 'package:colorswitch_app/home/bloc/home_screen_bloc.dart';
import 'package:colorswitch_app/home/bloc/home_screen_event.dart';
import 'package:colorswitch_app/home/bloc/home_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///HomeScreen main widget
class HomeScreen extends StatelessWidget {
  ///title font size
  static const fontSizeTitle = 34.0;

  ///bottom padding
  static const bottomPos = 80.0;

  ///space width
  static const spaceWidth = 20.0;

  ///constructor
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) => Scaffold(
        backgroundColor: state.backgroundColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            InkWell(
              onTap: () => BlocProvider.of<HomeScreenBloc>(context)
                  .add(GenerateRandomColor()),
              child: Center(
                child: Text(
                  'Hey there',
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    fontWeight: FontWeight.w600,
                    color: state.textColor,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: bottomPos,
              child: Center(
                child: Row(
                  children: [
                    CircleLittleButton(
                      text: 'R',
                      backgroundColor: state.textColor,
                      textColor:
                          state.redTons ? Colors.red : state.backgroundColor,
                      onTap: () => BlocProvider.of<HomeScreenBloc>(context)
                          .add(SwitchRedColor()),
                    ),
                    const SizedBox(
                      width: spaceWidth,
                    ),
                    CircleLittleButton(
                      text: 'G',
                      backgroundColor: state.textColor,
                      textColor: state.greenTons
                          ? Colors.green
                          : state.backgroundColor,
                      onTap: () => BlocProvider.of<HomeScreenBloc>(context)
                          .add(SwitchGreenColor()),
                    ),
                    const SizedBox(
                      width: spaceWidth,
                    ),
                    CircleLittleButton(
                      text: 'B',
                      backgroundColor: state.textColor,
                      textColor:
                          state.blueTons ? Colors.blue : state.backgroundColor,
                      onTap: () => BlocProvider.of<HomeScreenBloc>(context)
                          .add(SwitchBlueColor()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///CircleLittleButton
class CircleLittleButton extends StatelessWidget {
  ///text in button
  final String text;

  ///backgroundColor
  final Color backgroundColor;

  ///text color
  final Color textColor;

  ///on tap function
  final Function onTap;

  ///button sizes
  static const buttonSize = 45.0;

  ///font size
  static const fontSize = 24.0;

  ///constructor
  const CircleLittleButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // ignore: avoid_dynamic_calls
      onTap: () => onTap.call(),
      child: Container(
        alignment: Alignment.center,
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonSize),
          color: backgroundColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
