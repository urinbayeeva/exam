class WordsException implements Exception {
  final String xabar;

  WordsException(this.xabar);

  @override
  String toString() => 'WordsException($xabar)';
}

class Words {
  final String _word;

  factory Words(String word) {
    if (!word.toLowerCase().contains('aeiou')) {
      throw WordsException("So'zda unli harflar qatnashishi shart!");
    }

    return Words._internal(word);
  }

  Words._internal(this._word);

  @override
  String toString() => "So'z $_word";

  Words copyWith({String? word}) => Words(word ?? _word);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  int get hashCode => _word.hashCode;

  @override
  bool operator ==(Object other) => other is Words && _word == other._word;


  String teskariunliHarflar() {
    List<String> unlilar = ['a', 'e', 'i', 'o', 'u'],  harflar = _word.toLowerCase().split(''), teskariUnlilar = [];

    for (String harf in harflar) {
      if (unlilar.contains(harf)) {
        teskariUnlilar.add(harf);
      }
    }

    harflar.removeWhere((harf) => unlilar.contains(harf));
    harflar.addAll(teskariUnlilar.reversed);

    return harflar.join();
  }
}

void main() {
  try {
    final words = Words('hello');
    print(words.teskariunliHarflar());

    final words2 = Words('leetcode');
    print(words2.teskariunliHarflar()); 
  } on WordsException catch (e) {
    print(e); 
  }
}