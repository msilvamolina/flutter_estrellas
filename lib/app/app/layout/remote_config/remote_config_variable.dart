// remote_config_variable.dart
enum RemoteConfigValueType {
  boolType,
  stringType,
  intType,
  doubleType,
}

class RemoteConfigVariable {
  final String flutterName;
  final String firebaseName;
  final RemoteConfigValueType valueType;
  final dynamic defaultValue;

  RemoteConfigVariable({
    required this.flutterName,
    required this.firebaseName,
    required this.valueType,
    required this.defaultValue,
  });
}
