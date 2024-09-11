import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/navigation_data.dart';
import '../routes/app_pages.dart';
import '../ui/amzwidgets/amz.dart';

class MainController extends GetxController {
  int _indexSelected = 0;
  int get indexSelected => _indexSelected;
  List<Map> data = NavigationData.getData();
  List<Map> leftOptions = NavigationData.leftOptions();
  List<Map> leftOptions2 = NavigationData.leftOptions2();
  RxBool viewMore = false.obs;
  RxBool viewNotifications = false.obs;
  RxBool viewChat = false.obs;
  RxBool viewUser = false.obs;
  RxBool viewMoreOptions = false.obs;
  RxBool viewSearch = false.obs;
  RxString searchValue = ''.obs;
  FocusNode searchMobileFocusNode = FocusNode();

  @override
  void onInit() {
    print('MainController Init');
    super.onInit();
  }

  @override
  void onReady() {
    print('MainController Ready');
    super.onReady();
  }

  void changeIndex(int index) {
    _indexSelected = index;
    update(['navigation']);
  }

  void goToPage(int index) {
    changeIndex(index);
    String route = data[index]['route'];
    Get.toNamed(route);
  }

  void closeAllPanels() {
    viewNotifications.value = false;
    viewChat.value = false;
    viewUser.value = false;
    viewMoreOptions.value = false;
    viewSearch.value = false;
    searchMobileFocusNode.unfocus();

    update(['navigation']);
  }

  void openNotifications() {
    bool _currentValue = viewNotifications.value;
    closeAllPanels();
    viewNotifications.value = !_currentValue;
  }

  void openChat() {
    bool _currentValue = viewChat.value;

    closeAllPanels();
    viewChat.value = !_currentValue;
  }

  void openUser() {
    bool _currentValue = viewUser.value;

    closeAllPanels();
    viewUser.value = !_currentValue;
  }

  void openSearch() {
    closeAllPanels();
    viewSearch.value = true;
  }

  void onSearchKeyboard() {
    openSearch();
    searchMobileFocusNode.requestFocus();
  }

  void onSearchPressed() {}
  void onSearchChanged(String value) {
    searchValue.value = value;
    viewSearch.value = true;
  }

  void goHome() {
    Get.offAllNamed(Routes.HOME);
  }

  void openSearchMobile() {
    bool _currentValue = viewSearch.value;
    if (_currentValue == false) {
      closeAllPanels();
      viewSearch.value = !_currentValue;
      update(['navigation']);
    }
  }

  void openNotificationsMobile() {
    showAmzBottomSheet(Text('Notifications'));
  }

  void openMoreOptions() {
    showAmzBottomSheet(Text('Mas opciones'));
  }
}
