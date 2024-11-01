import 'package:package_info_plus/package_info_plus.dart';

enum Env { dev, qa, prod }

class Environment {
  Environment._constructor();

  static final Environment instance = Environment._constructor();

  String? _version;
  String? _packageVersion;

  String? get fullVersion => _version;
  String? get packageVersion => _packageVersion;

  String? _userCustomerApi;
  String? _passwordCustomerApi;
  String? _bearerTokenCustomerApi;

  String? get userCustomerApi => _userCustomerApi;
  String? get passwordCustomerApi => _passwordCustomerApi;
  String? get bearerTokenCustomerApi => _bearerTokenCustomerApi;

  late Env _currentEnv;
  Env get currentEnv => _currentEnv;
  Map<String, dynamic>? _deviceData;
  Map<String, dynamic>? get deviceInfo => _deviceData;

  Future<void> init({String env = ''}) async {
    if (env.isNotEmpty) {
      _currentEnv = env == 'prod'
          ? Env.prod
          : env == 'dev'
              ? Env.dev
              : Env.qa;
    } else {
      try {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        if (packageInfo.packageName == 'app.estrellas') {
          _currentEnv = Env.prod;
        } else if (packageInfo.packageName == 'app.estrellas.dev') {
          _currentEnv = Env.dev;
        } else {
          _currentEnv = Env.dev;
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
    PackageInfo _packageInfo = await PackageInfo.fromPlatform();
    _version = '${_packageInfo.version} (${_packageInfo.buildNumber})';
    _packageVersion = _packageInfo.version;
  }
}
