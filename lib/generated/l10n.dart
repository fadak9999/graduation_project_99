// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S? current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current!;
    });
  } 

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sections`
  String get titllehome {
    return Intl.message(
      'Sections',
      name: 'titllehome',
      desc: '',
      args: [],
    );
  }

  /// `Chatbot`
  String get chatbot {
    return Intl.message(
      'Chatbot',
      name: 'chatbot',
      desc: '',
      args: [],
    );
  }

  /// `Image To Text`
  String get text_to_imag {
    return Intl.message(
      'Image To Text',
      name: 'text_to_imag',
      desc: '',
      args: [],
    );
  }

  /// `Text To Speech`
  String get text_to_speech {
    return Intl.message(
      'Text To Speech',
      name: 'text_to_speech',
      desc: '',
      args: [],
    );
  }

  /// `Speech To Text`
  String get speech_to_text {
    return Intl.message(
      'Speech To Text',
      name: 'speech_to_text',
      desc: '',
      args: [],
    );
  }

  /// `Choose an Image`
  String get Choose_an_image {
    return Intl.message(
      'Choose an Image',
      name: 'Choose_an_image',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Enter text to speak`
  String get Enter {
    return Intl.message(
      'Enter text to speak',
      name: 'Enter',
      desc: '',
      args: [],
    );
  }

  /// `Speak`
  String get speak {
    return Intl.message(
      'Speak',
      name: 'speak',
      desc: '',
      args: [],
    );
  }

  /// `Press the microphone to speak...`
  String get press_mic_to_speak {
    return Intl.message(
      'Press the microphone to speak...',
      name: 'press_mic_to_speak',
      desc: '',
      args: [],
    );
  }

  /// `Microphone permission is required to use this feature.`
  String get microphone_permission_required {
    return Intl.message(
      'Microphone permission is required to use this feature.',
      name: 'microphone_permission_required',
      desc: '',
      args: [],
    );
  }

  /// `Speech recognition is not initialized properly.`
  String get speech_not_initialized {
    return Intl.message(
      'Speech recognition is not initialized properly.',
      name: 'speech_not_initialized',
      desc: '',
      args: [],
    );
  }

  /// `Your speech will appear here...`
  String get speech_will_appear_here {
    return Intl.message(
      'Your speech will appear here...',
      name: 'speech_will_appear_here',
      desc: '',
      args: [],
    );
  }

  /// `Listening now...`
  String get listening_now {
    return Intl.message(
      'Listening now...',
      name: 'listening_now',
      desc: '',
      args: [],
    );
  }

  /// `Gemini Chat`
  String get chatbot_title {
    return Intl.message(
      'Gemini Chat',
      name: 'chatbot_title',
      desc: '',
      args: [],
    );
  }

  /// `Type your message...`
  String get type_message_hint {
    return Intl.message(
      'Type your message...',
      name: 'type_message_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter a description for the image`
  String get enter_description {
    return Intl.message(
      'Enter a description for the image',
      name: 'enter_description',
      desc: '',
      args: [],
    );
  }

  /// `send`
  String get send {
    return Intl.message(
      'send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Write the description here...`
  String get image_attached {
    return Intl.message(
      'Write the description here...',
      name: 'image_attached',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  get write_description_hint => null;

  get error_preparing_image => null;

  get describe_image => null;

  get error_analyzing_image => null;

  get error_fetching_response => null;
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}