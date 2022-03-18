import 'package:flutter/material.dart';

///Home screen state
class HomeScreenState {
  ///background color
  Color backgroundColor;

  ///text color
  Color textColor;

  ///red color
  bool redTons;

  ///green color
  bool greenTons;

  ///blue color
  bool blueTons;

  ///constructor
  HomeScreenState({
    required this.backgroundColor,
    required this.textColor,
    this.redTons = false,
    this.blueTons = false,
    this.greenTons = false,
  });

  ///copywith method
  HomeScreenState copyWith({
    Color? backgroundColor,
    Color? textColor,
    bool? redTons,
    bool? blueTons,
    bool? greenTons,
  }) =>
      HomeScreenState(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        textColor: textColor ?? this.textColor,
        redTons: redTons ?? this.redTons,
        blueTons: blueTons ?? this.blueTons,
        greenTons: greenTons ?? this.greenTons,
      );
}
