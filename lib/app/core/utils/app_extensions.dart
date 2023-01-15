extension FormatString on String {
  String get capitalize {
    var text = this;

    if (text.isEmpty) {
      return text;
    }

    return text[0].toUpperCase() + text.substring(1);
  }

  String get putLeft {
    var text = this;

    return text.padLeft(3, '0');
  }
}
