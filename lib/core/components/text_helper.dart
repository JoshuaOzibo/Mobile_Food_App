String limitToTwoWords(String text) {
  final words = text.split(' ');
  if (words.length <= 2) {
    return text;
  }
  return '${words[0]} ${words[1]} ${words[2]}';
}
