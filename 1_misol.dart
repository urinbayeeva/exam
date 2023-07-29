class Words {
  final String word;

  Words._(this.word);

  factory Words(String input) {
    if (input.isEmpty || !RegExp(r'^[a-z]+$').hasMatch(input)) {
      throw InvalidWordException("Word should not be empty or should contain vowel letters!");
    }
    return Words._(input);
  }
  
  String reverseVowels() {
    List<String> vowels = ['a', 'e', 'i', 'o', 'u'];
    String reversedWord = '';
    List<String> wordChars = word.split('');

    for (var char in wordChars) {
      if (vowels.contains(char)) {
        reversedWord += char;
      }
    }

    for (var i = 0, j = reversedWord.length - 1; i < wordChars.length; i++) {
      if (vowels.contains(wordChars[i])) {
        wordChars[i] = reversedWord[j];
        j--;
      }
    }

    return wordChars.join();
  }
  
  @override
  String toString() {
    return 'Word: $word';
  }

  Words copyWith({String? word}) {
    return Words(word ?? this.word);
  }

  @override
  bool operator ==(other) {
    return (other is Words) && (other.word == this.word);
  }

  @override
  int get hashCode => word.hashCode;
}

class InvalidWordException implements Exception {
  final String message;

  InvalidWordException(this.message);
}

void main() {
  try {
    Words word1 = Words("hello");
    Words word2 = Words("leetcode");

    print(word1.reverseVowels()); // Output: holle
    print(word2.reverseVowels()); // Output: leotcede
  } catch (e) {
    print(e);
  }
}
