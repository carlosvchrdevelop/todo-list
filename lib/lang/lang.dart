import 'package:todo_list/lang/language.dart';

class Lang {
  static Language language = Language.english; // Overriden in settings_provider

  static List<Language> getLanguages() {
    return [Language.english, Language.spanish];
  }

  static String getLanguageLabel(Language lang) {
    switch (lang) {
      case Language.english:
        return 'English';
      case Language.spanish:
        return 'Español';
      default:
        return 'English';
    }
  }

  static const Map<Language, Map<String, String>> _translations = {
    Language.english: {
      'cancel': 'Cancel',
      'remove': 'Remove',
      'save': 'Save',
      'deletionConfirm': 'Please, confirm that you want to remove the task.',
      'title': 'Title',
      'description': 'Description',
      'addNewTask': 'Add new task',
      'editTask': 'Edit task',
      'settings': 'Settings',
      'needsRestart': 'You must restart to apply changes.',
    },
    Language.spanish: {
      'cancel': 'Cancelar',
      'remove': 'Eliminar',
      'save': 'Guardar',
      'deletionConfirm':
          'Por favor, confirma que realmente quieres borrar la tarea.',
      'title': 'Título',
      'description': 'Descripción',
      'addNewTask': 'Agregar nueva tarea',
      'editTask': 'Editar tarea',
      'settings': 'Configuración',
      'needsRestart': 'Se necesita reiniciar para aplicar los cambios.',
    }
  };

  static String get save {
    return _translations[language]!['save']!;
  }

  static String get cancel {
    return _translations[language]!['cancel']!;
  }

  static String get remove {
    return _translations[language]!['remove']!;
  }

  static String get deletionConfirm {
    return _translations[language]!['deletionConfirm']!;
  }

  static String get title {
    return _translations[language]!['title']!;
  }

  static String get description {
    return _translations[language]!['description']!;
  }

  static String get addNewTask {
    return _translations[language]!['addNewTask']!;
  }

  static String get editTask {
    return _translations[language]!['editTask']!;
  }

  static String get settings {
    return _translations[language]!['settings']!;
  }

  static String getNeedsRestart(Language _language) {
    return _translations[_language]!['needsRestart']!;
  }
}
