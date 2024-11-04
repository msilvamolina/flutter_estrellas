// remote_config_variables.dart
import 'remote_config_variable.dart';

final List<RemoteConfigVariable> remoteConfigVariables = [
  RemoteConfigVariable(
    flutterName: 'maintenance',
    firebaseName: 'maintenance',
    valueType: RemoteConfigValueType.boolType,
    defaultValue: false,
  ),
  RemoteConfigVariable(
    flutterName: 'forceUpdate',
    firebaseName: 'force_update',
    valueType: RemoteConfigValueType.stringType,
    defaultValue: '0',
  ),
  RemoteConfigVariable(
    flutterName: 'lastVersion',
    firebaseName: 'last_version',
    valueType: RemoteConfigValueType.stringType,
    defaultValue: '0',
  ),
  RemoteConfigVariable(
    flutterName: 'cartValue',
    firebaseName: 'cart_value',
    valueType: RemoteConfigValueType.stringType,
    defaultValue: '0',
  ),
  // Agrega más variables aquí
];
