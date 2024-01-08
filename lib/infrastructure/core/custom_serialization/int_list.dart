import 'dart:convert';

List<int> intListFromJson(dynamic data) {
  if (data is List) {
    return data.cast<int>();
  }
  return (json.decode(data) as List).cast<int>();
}

String intListToJson(List<int> list) {
  return list.toString();
}
