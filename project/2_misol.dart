import 'io_service.dart';

class LangControllar {
  static List<Map<String, String>> categories = [
    {"uz": "Salatlar", "ru": "Салаты", "en": "Salads"},
    {"uz": "Ichimliklar", "ru": "Напитки", "en": "Drinks"},
    {"uz": "Tez tayyor bo'ladigan ovqatlar", "ru": "Фастфуд", "en": "Fast food"},
    {"uz": "Shirinliklar", "ru": "Сладости", "en": "Sweets"},
    {"uz": "Milliy taomlar", "ru": "Национальная кухня", "en": "National foods"},
  ];

  static void tilniOzgartir(String til) {
    print("""                    Programma ${til.toUpperCase()} tiliga o'zgardi. """);

    for (var category in categories) {
      print(category[til]);
    }
  }
}


Future<void> showLoading() async {
  print("\n\n\t\t\t\t\tLoading...\n");
  await Future.delayed(Duration(seconds: 3));
  showAllFunction();
}

void showAllFunction(){
 io.inputText("""O'zingizga kerak bo'lgan tilni tanlang:  

 1.O'zbekcha
 2.Ruscha
 3.Inglizcha 

 Tanlang: 1/2/3
""");
  
  print("Tanlovingizni tasdiqlash uchun yana bir bor tanlang");
  var choice = io.readText();

  switch(choice){
    case "1":
    LangControllar.tilniOzgartir("uz");
    break;
    case "2":
    LangControllar.tilniOzgartir("ru");
    break;
    case "3":
    LangControllar.tilniOzgartir("eng");
    break;
    default:
    io.inputText("Unday til programmada mavjud emas");
    break;
  }
}

void main() => showLoading();



