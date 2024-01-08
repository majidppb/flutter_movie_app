int boolToJson(bool value) => value ? 1 : 0;

bool boolFromJson(dynamic value) {
  if (value.runtimeType == bool) {
    return value;
  }
  return value == 1;
}
