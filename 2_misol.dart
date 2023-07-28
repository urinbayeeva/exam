import 'dart:io';

class LangControls {
  static List<Map<String, String>> categories = [
    {"uz": "Salatlar", "ru": "Салаты", "en": "Salads"},
    {"uz": "Ichimliklar", "ru": "Напитки", "en": "Drinks"},
    {"uz": "Tezkor ovqatlar", "ru": "Фастфуд", "en": "Fast food"},
    {"uz": "Shirinliklar", "ru": "Сладости", "en": "Sweets"},
    {"uz": "Milliy taomlar", "ru": "Национальная кухня", "en": "National foods"},
  ];

  static void changeLanguage(String lang) {
    print("\nLanguage changed to $lang.");

    for (var category in categories) {
      print(category[lang]);
    }
  }
}

void main() {
  print("** Select a language **\n");
  print("1. Uzbek (ozbekcha)");
  print("2. Russian (русский)");
  print("3. English");

  stdout.write("\nEnter the language number: ");
  var selectedLang = stdin.readLineSync();

  if (selectedLang == "1") {
    LangControls.changeLanguage("uz");
  } else if (selectedLang == "2") {
    LangControls.changeLanguage("ru");
  } else if (selectedLang == "3") {
    LangControls.changeLanguage("en");
  } else {
    print("Invalid language selection!");
  }
}