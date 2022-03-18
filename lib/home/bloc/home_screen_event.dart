
///base of HomeScreenEvent
abstract class HomeScreenEvent {}

///generation color event
class GenerateRandomColor extends HomeScreenEvent {}

///switching red tons event
class SwitchRedColor extends HomeScreenEvent {}

///switching green tons event
class SwitchGreenColor extends HomeScreenEvent {}

///switching blue tons event
class SwitchBlueColor extends HomeScreenEvent {}
