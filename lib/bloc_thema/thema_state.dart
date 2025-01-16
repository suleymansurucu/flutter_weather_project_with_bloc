part of 'thema_bloc.dart';

sealed class ThemaState extends Equatable {
  const ThemaState();
}

final class ThemaInitial extends ThemaState {

  final ThemeData themeData;
  final MaterialColor materialColor;

  ThemaInitial({required this.themeData,required this.materialColor});
  @override
  List<Object> get props => [themeData,materialColor];
}
