import 'dart:math';

class PasswordGenerator {
  late List<String> passwordElements;
  late List<String> secondPasswordElements;
  bool includeUppercase = true;
  bool includeLowercase = true;
  bool includeNumbers = true;
  bool includeSymbols = true;
  int passwordLength = 10;

  void generatePasswords() {
    String uppercaseAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String lowercaseAlphabet = 'abcdefghijklmnopqrstuvwxyz';
    String numbers = '1234567890';
    String symbols = '!"#%&/()=+*¿¡?|°-.,';
    List<String> numbersInStr = numbers.split('');
    List<String> symbolsInStr = symbols.split('');
    List<String> lowercaseLetters = lowercaseAlphabet.split('');
    List<String> uppercaseLetters = uppercaseAlphabet.split('');

    final random = Random();
    int n = passwordLength;

    passwordElements = [];
    secondPasswordElements = [];

    for (int i = 0; i < n; i++) {
      if (i % 4 == 0 && includeUppercase) {
        secondPasswordElements
            .add(uppercaseLetters[random.nextInt(uppercaseLetters.length)]);
      } else if (i % 4 == 1 && includeLowercase) {
        secondPasswordElements
            .add(lowercaseLetters[random.nextInt(lowercaseLetters.length)]);
      } else if (i % 4 == 2 && includeNumbers) {
        secondPasswordElements
            .add(numbersInStr[random.nextInt(numbersInStr.length)]);
      } else if (includeSymbols) {
        secondPasswordElements
            .add(symbolsInStr[random.nextInt(symbolsInStr.length)]);
      }
    }

    for (int i = 0; i < n; i++) {
      if (i.isEven && includeUppercase) {
        passwordElements
            .add(uppercaseLetters[random.nextInt(uppercaseLetters.length)]);
      } else if (includeLowercase) {
        passwordElements
            .add(lowercaseLetters[random.nextInt(lowercaseLetters.length)]);
      }
    }
  }
}
