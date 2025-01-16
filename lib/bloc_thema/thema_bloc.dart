import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'thema_event.dart';
part 'thema_state.dart';

class ThemaBloc extends Bloc<ThemaEvent, ThemaState> {
  ThemaBloc()
      : super(ThemaInitial(
    themeData: ThemeData.light(),
    materialColor: Colors.blue,
  )) {
    on<ChangeThemeEvent>((event, emit) {
      final ThemeData newTheme;
      final MaterialColor newColor;

      switch (event.weatherCode) {
      // ☀️ Açık Hava - Güneşli
        case 1000:
          newTheme = ThemeData.light();
          newColor = Colors.orange;
          break;

      // 🌤 Parçalı Bulutlu - Hafif Bulutlu
        case 1003:
        case 1006:
          newTheme = ThemeData.light();
          newColor = Colors.blueGrey;
          break;

      // ☁️ Bulutlu - Kapalı
        case 1009:
          newTheme = ThemeData.dark();
          newColor = Colors.grey;
          break;

      // 🌧 Hafif Yağmur - Orta Şiddetli Yağmur
        case 1030:
        case 1063:
        case 1150:
        case 1153:
        case 1180:
        case 1183:
        case 1186:
        case 1189:
        case 1192:
        case 1195:
          newTheme = ThemeData.light();
          newColor = Colors.blue;
          break;

      // ⛈ Fırtına - Kuvvetli Yağmur
        case 1273:
        case 1276:
        case 1282:
          newTheme = ThemeData.dark();
          newColor = Colors.indigo;
          break;

      // ❄️ Kar - Buzlu Hava
        case 1114:
        case 1117:
        case 1210:
        case 1213:
        case 1216:
        case 1219:
        case 1222:
        case 1225:
        case 1237:
          newTheme = ThemeData.dark();
          newColor = Colors.lightBlue;
          break;

      // 🌫 Sis - Dumanlı Hava
        case 1135:
        case 1147:
          newTheme = ThemeData.dark();
          newColor = Colors.brown;
          break;

      // 🌩 Gök Gürültülü Fırtına
        case 1279:
          newTheme = ThemeData.dark();
          newColor = Colors.deepPurple;
          break;

      // 🌨 Karla Karışık Yağmur
        case 1066:
        case 1069:
        case 1072:
          newTheme = ThemeData.light();
          newColor = Colors.cyan;
          break;

      // Varsayılan (Bilinmeyen Kodlar)
        default:
          newTheme = ThemeData.light();
          newColor = Colors.blueGrey;
          break;
      }

      emit(ThemaInitial(themeData: newTheme, materialColor: newColor));
    });
  }
}
