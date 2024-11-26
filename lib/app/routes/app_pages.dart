import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../modules/account/about/bindings/about_binding.dart';
import '../modules/account/about/views/about_view.dart';
import '../modules/account/bank_accounts/bank_accounts/bindings/bank_accounts_binding.dart';
import '../modules/account/bank_accounts/bank_accounts/views/bank_accounts_view.dart';
import '../modules/account/bank_accounts/new_bank_account/bindings/new_bank_account_binding.dart';
import '../modules/account/bank_accounts/new_bank_account/views/new_bank_account_view.dart';
import '../modules/account/bank_accounts/new_bank_confirmation/bindings/new_bank_confirmation_binding.dart';
import '../modules/account/bank_accounts/new_bank_confirmation/views/new_bank_confirmation_view.dart';
import '../modules/account/favorites/bindings/favorites_binding.dart';
import '../modules/account/favorites/views/favorites_view.dart';
import '../modules/account/notifications_list/bindings/notifications_list_binding.dart';
import '../modules/account/notifications_list/views/notifications_list_view.dart';
import '../modules/account/phone_verification/bindings/phone_verification_binding.dart';
import '../modules/account/phone_verification/views/phone_verification_view.dart';
import '../modules/account/profile/bindings/profile_binding.dart';
import '../modules/account/profile/views/profile_view.dart';
import '../modules/address/address_list/bindings/address_binding.dart';
import '../modules/address/address_list/views/address_view.dart';
import '../modules/address/new_address/bindings/new_address_binding.dart';
import '../modules/address/new_address/views/new_address_view.dart';
import '../modules/auth/email_verification/bindings/email_verification_binding.dart';
import '../modules/auth/email_verification/views/email_verification_view.dart';
import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/login_start/bindings/login_start_binding.dart';
import '../modules/auth/login_start/views/login_start_view.dart';
import '../modules/auth/new_login/bindings/new_login_binding.dart';
import '../modules/auth/new_login/views/new_login_view.dart';
import '../modules/auth/new_register/bindings/new_register_binding.dart';
import '../modules/auth/new_register/views/new_register_view.dart';
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
import '../modules/catalog_details/bindings/catalog_details_binding.dart';
import '../modules/catalog_details/views/catalog_details_view.dart';
import '../modules/main/account/bindings/account_binding.dart';
import '../modules/main/account/views/account_view.dart';
import '../modules/main/home/bindings/home_binding.dart';
import '../modules/main/home/views/home_view.dart';
import '../modules/main/search/bindings/search_binding.dart';
import '../modules/main/search/views/search_view.dart';
import '../modules/main/store/bindings/store_binding.dart';
import '../modules/main/store/views/store_view.dart';
import '../modules/main/wallet/bindings/wallet_binding.dart';
import '../modules/main/wallet/views/wallet_view.dart';
import '../modules/order/order_details/bindings/order_details_binding.dart';
import '../modules/order/order_details/views/order_details_view.dart';
import '../modules/order/order_error/bindings/order_error_binding.dart';
import '../modules/order/order_error/views/order_error_view.dart';
import '../modules/order/order_success/bindings/order_success_binding.dart';
import '../modules/order/order_success/views/order_success_view.dart';
import '../modules/order/orders/bindings/orders_binding.dart';
import '../modules/order/orders/views/orders_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/select_payment/bindings/select_payment_binding.dart';
import '../modules/select_payment/views/select_payment_view.dart';
import '../modules/selects/select_city/bindings/select_city_binding.dart';
import '../modules/selects/select_city/views/select_city_view.dart';
import '../modules/selects/select_department/bindings/select_department_binding.dart';
import '../modules/selects/select_department/views/select_department_view.dart';
import '../modules/social_media_share/bindings/social_media_share_binding.dart';
import '../modules/social_media_share/views/social_media_share_view.dart';
import '../modules/videos/video_details/bindings/video_details_binding.dart';
import '../modules/videos/video_details/views/video_details_view.dart';
import '../modules/videos/video_list/bindings/video_list_binding.dart';
import '../modules/videos/video_list/views/video_list_view.dart';

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
    // GetPage(
    //   name: _Paths.LOGIN,
    //   page: () => LoginView(),
    //   binding: LoginBinding(),
    //   transition: Transition.fadeIn,
    // ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    // GetPage(
    //   name: _Paths.REGISTER,
    //   page: () => const RegisterView(),
    //   binding: RegisterBinding(),
    //   transition: Transition.fadeIn,
    // ),
    // GetPage(
    //   name: _Paths.REGISTER_BASIC_DATA,
    //   page: () => const RegisterBasicDataView(),
    //   binding: RegisterBasicDataBinding(),
    //   transition: Transition.fadeIn,
    // ),
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
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.BANK_ACCOUNTS,
      page: () => const BankAccountsView(),
      binding: BankAccountsBinding(),
      children: [
        GetPage(
          name: _Paths.BANK_ACCOUNTS,
          page: () => const BankAccountsView(),
          binding: BankAccountsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_LIST,
      page: () => const VideoListView(),
      binding: VideoListBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_START,
      page: () => const LoginStartView(),
      binding: LoginStartBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.NEW_LOGIN,
      page: () => const NewLoginView(),
      binding: NewLoginBinding(),
    ),
    GetPage(
      name: _Paths.NEW_REGISTER,
      page: () => const NewRegisterView(),
      binding: NewRegisterBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_VERIFICATION,
      page: () => const EmailVerificationView(),
      binding: EmailVerificationBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_ERROR,
      page: () => const OrderErrorView(),
      binding: OrderErrorBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CATALOG_DETAILS,
      page: () => const CatalogDetailsView(),
      binding: CatalogDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_VERIFICATION,
      page: () => const PhoneVerificationView(),
      binding: PhoneVerificationBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_DETAILS,
      page: () => const VideoDetailsView(),
      binding: VideoDetailsBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS_LIST,
      page: () => const NotificationsListView(),
      binding: NotificationsListBinding(),
    ),
    GetPage(
      name: _Paths.NEW_BANK_ACCOUNT,
      page: () => const NewBankAccountView(),
      binding: NewBankAccountBinding(),
    ),
    GetPage(
      name: _Paths.NEW_BANK_CONFIRMATION,
      page: () => const NewBankConfirmationView(),
      binding: NewBankConfirmationBinding(),
    ),
    GetPage(
        name: _Paths.SOCIAL_MEDIA_SHARE,
        page: () => const SocialMediaShareView(),
        binding: SocialMediaShareBinding(),
        transition: Transition.downToUp),
  ];
}
