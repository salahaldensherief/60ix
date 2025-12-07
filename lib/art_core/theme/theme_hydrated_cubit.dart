import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sixty_ix/modules/art_core/theme/themes.dart';

import '../../core/cache/preference_manager.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(AppThemes.themeMode());

  // PreferenceManager().isDarkMode() ? ThemeMode.dark : ThemeMode.light);

  void toggleTheme() {
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    PreferenceManager().setDarkMode(newMode == ThemeMode.dark);
    emit(newMode);
  }
}
