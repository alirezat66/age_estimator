extension StringExt on String{
  Uri get agifyUri => Uri.parse('https://api.agify.io$this');
}