import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Multilingual {
  final Locale appLocale;

  Multilingual(this.appLocale);

  static Multilingual of(BuildContext context) {
    return Localizations.of<Multilingual>(context, Multilingual);
  }

  static const LocalizationsDelegate<Multilingual> delegate =
      _MultilingualDelegate();

  Map<String, String> _multilingualStrings;

  Future<bool> load() async {
    // Load JSON file from the "language" folder
    //String jsonString = await rootBundle.loadString('packages/multilingual/assets/language/${appLocale.languageCode}.json');

    String jsonString = await rootBundle
        .loadString('assets/language/${appLocale.languageCode}.json');
    Map<String, dynamic> jsonLanguageMap = json.decode(jsonString);
    _multilingualStrings = jsonLanguageMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  // called from every widget which needs a localized text
  String getText(String key) {
    return _multilingualStrings[key] != null ? _multilingualStrings[key] : "";
  }
}

class _MultilingualDelegate extends LocalizationsDelegate<Multilingual> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _MultilingualDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<Multilingual> load(Locale locale) async {
    // Multilingual class is where the JSON loading actually runs
    Multilingual multilingual = new Multilingual(locale);
    await multilingual.load();
    return multilingual;
  }

  @override
  bool shouldReload(_MultilingualDelegate old) => false;
}
