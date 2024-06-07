import 'dart:convert';

extension StringExt on String {
  Uri get agifyUri => Uri.parse('https://api.agify.io$this');
  Map<String, dynamic> get toMap => jsonDecode(this);
}
