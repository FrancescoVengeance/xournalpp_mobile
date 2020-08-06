// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get newDocument {
    return Intl.message(
      'New Document',
      name: 'newDocument',
      desc: '',
      args: [],
    );
  }

  String get tools {
    return Intl.message(
      'Tools',
      name: 'tools',
      desc: '',
      args: [],
    );
  }

  String get toolboxNotImplementedYet {
    return Intl.message(
      'Toolbox not implemented yet.',
      name: 'toolboxNotImplementedYet',
      desc: '',
      args: [],
    );
  }

  String get setDocumentTitle {
    return Intl.message(
      'Set document title',
      name: 'setDocumentTitle',
      desc: '',
      args: [],
    );
  }

  String get newTitle {
    return Intl.message(
      'New title',
      name: 'newTitle',
      desc: '',
      args: [],
    );
  }

  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  String get mobileEditionUnofficial {
    return Intl.message(
      'mobile edition (unofficial)',
      name: 'mobileEditionUnofficial',
      desc: '',
      args: [],
    );
  }

  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  String get newFile {
    return Intl.message(
      'New',
      name: 'newFile',
      desc: '',
      args: [],
    );
  }

  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  String get notImplemented {
    return Intl.message(
      'Not implemented',
      name: 'notImplemented',
      desc: '',
      args: [],
    );
  }

  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  String get aboutXournalMobileEdition {
    return Intl.message(
      'About Xournal++ - mobile edition',
      name: 'aboutXournalMobileEdition',
      desc: '',
      args: [],
    );
  }

  String get xournalMobileEditionIsAnUnofficialProjectTryingToMake {
    return Intl.message(
      'Xournal++ - mobile edition is an unofficial project trying to make Xournal++ files and features available on different devices.',
      name: 'xournalMobileEditionIsAnUnofficialProjectTryingToMake',
      desc: '',
      args: [],
    );
  }

  String get aboutXournal {
    return Intl.message(
      'About Xournal++',
      name: 'aboutXournal',
      desc: '',
      args: [],
    );
  }

  String get sourceCode {
    return Intl.message(
      'Source Code',
      name: 'sourceCode',
      desc: '',
      args: [],
    );
  }

  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  String get doubleTapToChange {
    return Intl.message(
      'Double tap to change.',
      name: 'doubleTapToChange',
      desc: '',
      args: [],
    );
  }

  String get notWorkingYet {
    return Intl.message(
      'Not working yet.',
      name: 'notWorkingYet',
      desc: '',
      args: [],
    );
  }

  String get loadingFile {
    return Intl.message(
      'Loading file...',
      name: 'loadingFile',
      desc: '',
      args: [],
    );
  }

  String get noFileSelected {
    return Intl.message(
      'No file selected',
      name: 'noFileSelected',
      desc: '',
      args: [],
    );
  }

  String get youDidNotSelectAnyFile {
    return Intl.message(
      'You did not select any file.',
      name: 'youDidNotSelectAnyFile',
      desc: '',
      args: [],
    );
  }

  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  String get recentFiles {
    return Intl.message(
      'Recent files',
      name: 'recentFiles',
      desc: '',
      args: [],
    );
  }

  String get newNotebook {
    return Intl.message(
      'New Notebook',
      name: 'newNotebook',
      desc: '',
      args: [],
    );
  }

  String get noRecentFiles {
    return Intl.message(
      'No recent files.',
      name: 'noRecentFiles',
      desc: '',
      args: [],
    );
  }

  String get openingFile {
    return Intl.message(
      'Opening file',
      name: 'openingFile',
      desc: '',
      args: [],
    );
  }

  String get errorOpeningFile {
    return Intl.message(
      'Error opening file',
      name: 'errorOpeningFile',
      desc: '',
      args: [],
    );
  }

  String get dropFilesToOpen {
    return Intl.message(
      'Drop files to open',
      name: 'dropFilesToOpen',
      desc: '',
      args: [],
    );
  }

  String get errorLoadingFile {
    return Intl.message(
      'Error loading file',
      name: 'errorLoadingFile',
      desc: '',
      args: [],
    );
  }

  String get theFollowingErrorWasDetected {
    return Intl.message(
      'The following error was detected:',
      name: 'theFollowingErrorWasDetected',
      desc: '',
      args: [],
    );
  }

  String get copyErrorMessage {
    return Intl.message(
      'Copy error message',
      name: 'copyErrorMessage',
      desc: '',
      args: [],
    );
  }

  String get imVerySorryButICouldntReadTheFile {
    return Intl.message(
      'I\'m very sorry, but I couldn\'t read the file ',
      name: 'imVerySorryButICouldntReadTheFile',
      desc: '',
      args: [],
    );
  }

  String get areYouSureIHaveThePermissionAndAreYou {
    return Intl.message(
      '. Are you sure I have the permission? And are you sure it is a Xournal++ file?',
      name: 'areYouSureIHaveThePermissionAndAreYou',
      desc: '',
      args: [],
    );
  }

  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  String get youveBeenRedirectedToTheLocalApp {
    return Intl.message(
      'You\'ve been redirected to the local app.',
      name: 'youveBeenRedirectedToTheLocalApp',
      desc: '',
      args: [],
    );
  }

  String get opening {
    return Intl.message(
      'Opening',
      name: 'opening',
      desc: '',
      args: [],
    );
  }

  String get background {
    return Intl.message(
      'Background',
      name: 'background',
      desc: '',
      args: [],
    );
  }

  String get abort {
    return Intl.message(
      'Abort',
      name: 'abort',
      desc: '',
      args: [],
    );
  }

  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}