import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final GetStorage _getStorage = GetStorage();
  static const USERKEY = "USERKEY";
  static const welcomeKey = "WELCOMEKEY";
  static const swipeUpKey = "SWIPEUPKEY";
  static const tokenKey = "tokenKey";

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

  Future<void> setToken(String value) async {
    await _getStorage.write(tokenKey, value);
  }

  Future<String?> getToken() async {
    final value = await _getStorage.read(tokenKey);
    return value;
  }

  Future<bool> getSwipeUpVideo() async {
    final value = await _getStorage.read(swipeUpKey) ?? true;
    return value;
  }

  Future<void> setSwipeUpVideo(bool value) async {
    await _getStorage.write(swipeUpKey, value);
  }
}
