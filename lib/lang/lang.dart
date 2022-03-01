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
      'viewTypeRegular': 'Regular',
      'viewTypeCompact': 'Compact',
      'viewTypeComfortable': 'Comfortable',
      'filter': 'Filter',
      'apply': 'Apply',
      'stateDone': 'Completed',
      'statePending': 'Pending',
      'stateOverdue': 'Overdue',
      'onlyPriority': 'Only priority',
      'close': 'Close',
      'reset': 'Reset',
      'color': 'Color',
      'lang': 'Language',
      'viewType': 'View type',
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
      'viewTypeRegular': 'Normal',
      'viewTypeCompact': 'Compacto',
      'viewTypeComfortable': 'Cómodo',
      'filter': 'Filtrar',
      'apply': 'Aplicar',
      'stateDone': 'Completadas',
      'statePending': 'Pendientes',
      'stateOverdue': 'Pasadas de fecha',
      'onlyPriority': 'Solo prioritarios',
      'close': 'Cerrar',
      'reset': 'Restablecer',
      'color': 'Color',
      'lang': 'Idioma',
      'viewType': 'Tipo de vista',
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

  static String get viewTypeRegular {
    return _translations[language]!['viewTypeRegular']!;
  }

  static String get viewTypeCompact {
    return _translations[language]!['viewTypeCompact']!;
  }

  static String get viewTypeComfortable {
    return _translations[language]!['viewTypeComfortable']!;
  }

  static String get filter {
    return _translations[language]!['filter']!;
  }

  static String get apply {
    return _translations[language]!['apply']!;
  }

  static String get stateDone {
    return _translations[language]!['stateDone']!;
  }

  static String get statePending {
    return _translations[language]!['statePending']!;
  }

  static String get stateOverdue {
    return _translations[language]!['stateOverdue']!;
  }

  static String get onlyPriority {
    return _translations[language]!['onlyPriority']!;
  }

  static String get close {
    return _translations[language]!['close']!;
  }

  static String get reset {
    return _translations[language]!['reset']!;
  }

  static String get color {
    return _translations[language]!['color']!;
  }

  static String get lang {
    return _translations[language]!['lang']!;
  }

  static String get viewType {
    return _translations[language]!['viewType']!;
  }
}
