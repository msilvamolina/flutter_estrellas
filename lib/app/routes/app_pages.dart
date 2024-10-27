import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../modules/main/account/bindings/account_binding.dart';
import '../modules/main/account/views/account_view.dart';
import '../modules/address/address_list/bindings/address_binding.dart';
import '../modules/address/address_list/views/address_view.dart';
import '../modules/address/new_address/bindings/new_address_binding.dart';
import '../modules/address/new_address/views/new_address_view.dart';
import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/auth/register_basic_data/bindings/register_basic_data_binding.dart';
import '../modules/auth/register_basic_data/views/register_basic_data_view.dart';
import '../modules/auth/splash/bindings/splash_binding.dart';
import '../modules/auth/splash/views/splash_view.dart';
import '../modules/auth/welcome/bindings/welcome_binding.dart';
import '../modules/auth/welcome/views/welcome_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/main/home/bindings/home_binding.dart';
import '../modules/main/home/views/home_view.dart';
import '../modules/main/search/bindings/search_binding.dart';
import '../modules/main/search/views/search_view.dart';
import '../modules/main/store/bindings/store_binding.dart';
import '../modules/main/store/views/store_view.dart';
import '../modules/main/wallet/bindings/wallet_binding.dart';
import '../modules/main/wallet/views/wallet_view.dart';
import '../modules/order/order_success/bindings/order_success_binding.dart';
import '../modules/order/order_success/views/order_success_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/select_payment/bindings/select_payment_binding.dart';
import '../modules/select_payment/views/select_payment_view.dart';
import '../modules/selects/select_city/bindings/select_city_binding.dart';
import '../modules/selects/select_city/views/select_city_view.dart';
import '../modules/selects/select_department/bindings/select_department_binding.dart';
import '../modules/selects/select_department/views/select_department_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = kIsWeb ? Routes.HOME : Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.REGISTER_BASIC_DATA,
      page: () => const RegisterBasicDataView(),
      binding: RegisterBasicDataBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
      transition: Transition.downToUp,
      opaque: false,
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS,
      page: () => const AddressView(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: _Paths.NEW_ADDRESS,
      page: () => const NewAddressView(),
      binding: NewAddressBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_DEPARTMENT,
      page: () => const SelectDepartmentView(),
      binding: SelectDepartmentBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_CITY,
      page: () => const SelectCityView(),
      binding: SelectCityBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_PAYMENT,
      page: () => const SelectPaymentView(),
      binding: SelectPaymentBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_SUCCESS,
      page: () => const OrderSuccessView(),
      binding: OrderSuccessBinding(),
    ),
    GetPage(
      name: _Paths.STORE,
      page: () => const StoreView(),
      binding: StoreBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => const WalletView(),
      binding: WalletBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
