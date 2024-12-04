import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum Env { dev, qa, prod }

class Environment {
  Environment._privateConstructor();

  static final Environment instance = Environment._privateConstructor();

  String? fullVersion;
  String? version;
  String? packageVersion;

  String? userCustomerApi;
  String? passwordCustomerApi;
  String? bearerTokenCustomerApi;

  Env? currentEnv;
  static Map<String, dynamic>? deviceInfo;
  static String? websiteUrl;

  /// Inicializa el entorno basado en la configuración proporcionada
  Future<void> init({String env = ''}) async {
    try {
      // Obtener información del paquete
      final packageInfo = await PackageInfo.fromPlatform();

      // Configurar el entorno basado en el nombre del paquete o el argumento
      currentEnv = _determineEnvironment(env, packageInfo.packageName);

      // Configurar versiones
      fullVersion = '${packageInfo.version} (${packageInfo.buildNumber})';
      version = packageInfo.version;
      packageVersion = packageInfo.version;

      websiteUrl = currentEnv == Env.prod ? 'estrellas.app' : 'estrellas.pro';
      // Inicializar valores predeterminados para API si es necesario
      userCustomerApi ??= '';
      passwordCustomerApi ??= '';
      bearerTokenCustomerApi ??= '';

      final deviceInfoPlugin = DeviceInfoPlugin();
      final _deviceInfo = await deviceInfoPlugin.deviceInfo;
      deviceInfo = _deviceInfo.data;
    } catch (e) {
      // Lanzar excepciones con contexto útil
      throw Exception('Error al inicializar el entorno: $e');
    }
  }

  /// Determina el entorno basado en el nombre del paquete o el argumento `env`
  Env _determineEnvironment(String env, String packageName) {
    if (env.isNotEmpty) {
      return env == 'prod'
          ? Env.prod
          : env == 'dev'
              ? Env.dev
              : Env.qa;
    }

    // Fallback a los nombres de paquete
    if (packageName == 'app.estrellas') {
      return Env.prod;
    } else if (packageName == 'app.estrellas.dev') {
      return Env.dev;
    } else {
      return Env.qa;
    }
  }
}
