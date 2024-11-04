// remote_config_variables.dart
import 'package:flutter_estrellas/app/config/features/features.dart';

import '../../app/layout/remote_config/remote_config_variable.dart';

final List<RemoteConfigVariable> remoteConfigVariables = [
  RemoteConfigVariable(
    name: Features.maintenance.name,
    valueType: RemoteConfigValueType.boolType,
    defaultValue: false,
  ),
  RemoteConfigVariable(
    name: Features.forceUpdate.name,
    valueType: RemoteConfigValueType.stringType,
    defaultValue: '0',
  ),
  RemoteConfigVariable(
    name: Features.lastVersion.name,
    valueType: RemoteConfigValueType.stringType,
    defaultValue: '0',
  ),
  RemoteConfigVariable(
    name: Features.cartValue.name,
    valueType: RemoteConfigValueType.stringType,
    defaultValue: '0',
  ),
  // Agrega más variables aquí
];
