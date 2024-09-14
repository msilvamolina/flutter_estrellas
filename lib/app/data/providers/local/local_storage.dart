import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final GetStorage _getStorage = GetStorage();
  static const USERKEY = "USERKEY";

  Future<void> cleanAll() async {
    await _getStorage.remove(USERKEY);
    await _getStorage.erase();
  }
}
