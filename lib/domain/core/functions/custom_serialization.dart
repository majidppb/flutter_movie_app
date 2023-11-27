// bool
import 'dart:convert';

int boolToJson(bool value) => value ? 1 : 0;

bool boolFromJson(dynamic value) {
  if (value.runtimeType == bool) {
    return value;
  }
  return value == 1;
}

// List<int>
List<int> intListFromJson(dynamic data) {
  if (data is List) {
    return data.cast<int>();
  }
  return (json.decode(data) as List).cast<int>();
}

String intListToJson(List<int> list) {
  return list.toString();
}
