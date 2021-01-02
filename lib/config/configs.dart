/*
 * Created on Sat Jan 02 2021
 *
 * BSD 3-Clause License
 *
 *Copyright (c) 2020, Kanan Yusubov
 *All rights reserved.
 *
 *Redistribution and use in source and binary forms, with or without
 *modification, are permitted provided that the following conditions are met:
 *
 *1. Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 *2. Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 *3. Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 *THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 *FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 *DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 *SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 *OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../blocs/localization_cubit/localization_cubit.dart';
import '../blocs/theme_cubit/theme_cubit.dart';
import '../data/services/preferences_store_service.dart';
import '../blocs/kanza_bloc_observer.dart';

class Configs {
  /// You should await for it to ensure that
  /// all [Services] and configurations
  /// successfully initialized
  static Future<void> initAllSettings() async {
    await Hive.initFlutter();
    await PreferencesStoreService.init();

    if (kDebugMode) {
      Bloc.observer = KanzaBlocObserver();
      EquatableConfig.stringify = true;
    }

    locale = await _locale;
    themeMode = await _themeMode;
  }

  static Locale locale;
  static ThemeMode themeMode;

  /// Logic for localization initialization
  static Future<Locale> get _locale async {
    final LocalizationCubit localizationCubit = LocalizationCubit(null);
    final defaultLocale = await localizationCubit.loadDefaultLocale();
    await localizationCubit?.close();
    return defaultLocale;
  }

  /// Logic for theme initialization
  static Future<ThemeMode> get _themeMode async {
    final ThemeCubit themeCubit = ThemeCubit(null);
    final defaultThemeMode = await themeCubit.loadDefaultTheme();
    await themeCubit?.close();
    return defaultThemeMode;
  }
}
