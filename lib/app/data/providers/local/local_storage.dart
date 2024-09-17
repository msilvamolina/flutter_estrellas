import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final GetStorage _getStorage = GetStorage();
  static const USERKEY = "USERKEY";
  static const welcomeKey = "WELCOMEKEY";

  Future<void> cleanAll() async {
    await _getStorage.remove(USERKEY);
    await _getStorage.erase();
  }

  Future<bool> getWelcome() async {
    final value = await _getStorage.read(welcomeKey) ?? false;
    return value;
  }

  Future<void> setWelcome(bool value) async {
    await _getStorage.write(welcomeKey, value);
  }
}
