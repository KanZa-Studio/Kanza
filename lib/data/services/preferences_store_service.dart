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

import 'package:hive/hive.dart';

class PreferencesStoreService {
  PreferencesStoreService._();

  /// initialized [PreferencesStoreService]
  /// and opens [PreferencesBox] to store preferences
  static Future<void> init() async {
    if (_instance == null) {
      final box = await Hive.openBox('preferencesBox');
      _instance = PreferencesStoreService._();
      _instance._preferencesBox = box;
    }
  }

  static PreferencesStoreService _instance;
  static PreferencesStoreService get instance => _instance;

  Box _preferencesBox;

  Future<void> setDarkModeInfo(bool isDarkModeEnabled) =>
      _preferencesBox.put('theme', isDarkModeEnabled);

  bool get isDarkModeEnabled => _preferencesBox.get('theme');

  Future<void> setUserLogged() => _preferencesBox.put('user_logged', true);

  bool get isUserLogged => _preferencesBox.get('user_logged');

  Future<void> setLanguageCode(String languageCode) =>
      _preferencesBox.put('languageCode', languageCode);

  String get currentLanguageCode => _preferencesBox.get('languageCode');

  Future<void> setCountryCode(String languageCode) =>
      _preferencesBox.put('countryCode', languageCode);

  String get currentCountryCode => _preferencesBox.get('countryCode');
}
