part of 'thema_bloc.dart';

sealed class ThemaEvent extends Equatable {
  const ThemaEvent();
}

class ChangeThemeEvent extends ThemaEvent{

  final int weatherCode;
  ChangeThemeEvent({required this.weatherCode}) ;

  @override
  List<Object?> get props => [weatherCode];

}
