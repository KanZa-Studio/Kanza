import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../presentation/values/supported_locales.dart';
import '../../data/services/preferences_store_service.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit(Locale locale)
      : super(LocalizationState(locale ?? supportedLocales[0]));

  final _preferencesStoreService = PreferencesStoreService.instance;

  Future<void> changeLocale(String selectedLanguageCode) async {
    final defaultLanguageCode = _preferencesStoreService.currentLanguageCode;

    if (defaultLanguageCode == selectedLanguageCode) return;

    if (selectedLanguageCode == 'az') {
      _preferencesStoreService.setLanguageCode('az');
      _preferencesStoreService.setCountryCode('AZ');
      emit(LocalizationState(supportedLocales[1]));
    } else {
      _preferencesStoreService.setLanguageCode('en');
      _preferencesStoreService.setLanguageCode('US');
      emit(LocalizationState(supportedLocales[0]));
    }
  }

  Future<Locale> loadDefaultLocale() async {
    final defaultLanguageCode = _preferencesStoreService.currentLanguageCode;
    final defaultCountryCode = _preferencesStoreService.currentLanguageCode;

    var defaultLocale;

    if (defaultLanguageCode == null && defaultCountryCode == null) {
      defaultLocale = Locale('en', 'US');

      _preferencesStoreService.setLanguageCode('en');
      _preferencesStoreService.setCountryCode('US');
    } else {
      defaultLocale = Locale(defaultLanguageCode, defaultCountryCode);
    }

    return defaultLocale;
  }
}
