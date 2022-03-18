import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:colorswitch_app/home/bloc/home_screen_event.dart';
import 'package:colorswitch_app/home/bloc/home_screen_state.dart';
import 'package:flutter/material.dart';

///Home screen bloc
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  ///constructor
  HomeScreenBloc()
      : super(
          HomeScreenState(
            backgroundColor: Colors.white,
            textColor: Colors.black54,
          ),
        ) {
    on<GenerateRandomColor>(_randomize);
    on<SwitchRedColor>(
      (event, emit) => emit(state.copyWith(redTons: !state.redTons)),
    );
    on<SwitchGreenColor>(
      (event, emit) => emit(state.copyWith(greenTons: !state.greenTons)),
    );
    on<SwitchBlueColor>(
      (event, emit) => emit(state.copyWith(blueTons: !state.blueTons)),
    );
  }

  Future<void> _randomize(
    // ignore: avoid-unused-parameters
    HomeScreenEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    final Random rnd = Random();

    final red = rnd.nextInt(70) + (state.redTons ? 130 : 0);
    final green = rnd.nextInt(70) + (state.greenTons ? 130 : 0);
    final blue = rnd.nextInt(70) + (state.blueTons ? 130 : 0);

    final bgColor = Color.fromRGBO(red, green, blue, 1);
    final textColor = Color.fromRGBO(red + 55, green + 55, blue + 55, 1);

    emit(
      state.copyWith(
        backgroundColor: bgColor,
        textColor: textColor,
      ),
    );
  }
}
