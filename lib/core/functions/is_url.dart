bool isURL(String text) {
  const urlPattern =
      r"^(https?:\/\/)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(:\d+)?(\/[^\s]*)?$";
  final result = RegExp(urlPattern).hasMatch(text);
  return result;
}
