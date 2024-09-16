class FriendlyHelpers {
  static List<String> keywords(
      {required List<String> words, bool forceFrendly = true}) {
    List<String> _return = [];

    for (var i = 0; i < words.length; i++) {
      String text = words[i];
      List<String> key1 = generateKeywords(text);
      _return.addAll(key1);

      if (forceFrendly) {
        String _frendlyText = friendlyText(text: text);
        List<String> key2 = generateKeywords(_frendlyText);
        _return.addAll(key2);
      }
    }

    return _return.toSet().toList();
  }

  static List<String> generateKeywords(String t) {
    List<String> arregloKeywords = [];
    String text = t.trim();
    var arregloPalabras = text.split(' ');

    for (int i = 0; i < arregloPalabras.length; i++) {
      var palabraResumida = "";
      var letra = arregloPalabras[i].split('');
      for (var i2 = 0; i2 < letra.length; i2++) {
        palabraResumida += letra[i2];
        arregloKeywords.add(palabraResumida.toLowerCase());
      }
    }

    var letraResumida = "";
    var textSplit = text.split('');

    for (var i = 0; i < textSplit.length; i++) {
      letraResumida += textSplit[i];
      arregloKeywords.add(letraResumida.toLowerCase());
    }

    return arregloKeywords;
  }

  static String friendlySearchField(String text) {
    String _friendlyText = friendlyText(text: text);
    String _searchField = text + ' ' + text.toLowerCase() + ' ' + _friendlyText;
    return _searchField;
  }

  static String friendlyText({required String text, bool withSpaces = true}) {
    String variable = quitarAcentos(text.toLowerCase());
    variable = variable.replaceAll('   ', ' ');
    variable = variable.replaceAll('  ', ' ');
    variable = variable.replaceAll('.', '');
    variable = variable.replaceAll("'", '');
    variable = variable.replaceAll('"', '');
    variable = variable.replaceAll('+', '');
    variable = variable.replaceAll('(', '');
    variable = variable.replaceAll(')', '');
    variable = variable.replaceAll('@', '');
    variable = variable.replaceAll('#', '');
    variable = variable.replaceAll('\$', '');
    variable = variable.replaceAll('%', '');
    variable = variable.replaceAll('^', '');
    variable = variable.replaceAll('&', '');
    variable = variable.replaceAll('*', '');
    variable = variable.replaceAll('!', '');
    variable = variable.replaceAll('=', '');
    variable = variable.replaceAll('_', '-');
    variable = variable.replaceAll('?', '');
    variable = variable.replaceAll('/', '');
    variable = variable.replaceAll('¡', '');
    variable = variable.replaceAll('`', '');
    variable = variable.replaceAll('^', '');
    variable = variable.replaceAll('´', '');
    variable = variable.replaceAll('¨', '');
    variable = variable.replaceAll('¿', '');
    variable = variable.replaceAll('•', '');
    variable = variable.replaceAll(',', '');
    variable = variable.replaceAll(':', '');

    if (!withSpaces) {
      variable = variable.replaceAll(' ', '-');
    }
    return variable;
  }

  static String frendlyLink(String link) {
    String variable = quitarAcentos(link.toLowerCase());
    variable = variable.replaceAll('https', '');
    variable = variable.replaceAll('http', '');
    variable = variable.replaceAll('www.', '');
    variable = variable.replaceAll('www', '');
    variable = variable.replaceAll('://', '');

    return variable.trim();
  }

  static String quitarAcentos(String elemento) {
    elemento = elemento.replaceAll('á', 'a');
    elemento = elemento.replaceAll('é', 'e');
    elemento = elemento.replaceAll('í', 'i');
    elemento = elemento.replaceAll('ó', 'o');
    elemento = elemento.replaceAll('ú', 'u');
    elemento = elemento.replaceAll('ñ', 'n');
    elemento = elemento.replaceAll('ä', 'a');
    elemento = elemento.replaceAll('ë', 'e');
    elemento = elemento.replaceAll('ï', 'i');
    elemento = elemento.replaceAll('ö', 'o');
    elemento = elemento.replaceAll('ü', 'u');
    return elemento;
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
