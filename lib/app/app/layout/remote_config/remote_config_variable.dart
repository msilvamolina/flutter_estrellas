// remote_config_variable.dart
enum RemoteConfigValueType {
  boolType,
  stringType,
  intType,
  doubleType,
}

class RemoteConfigVariable {
  final String name;
  final RemoteConfigValueType valueType;
  final dynamic defaultValue;

  RemoteConfigVariable({
    required this.name,
    required this.valueType,
    required this.defaultValue,
  });
}
