import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/bottom_sheets/share_bottomsheet.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../app/bottom_sheets/auth_signout_bottomsheet.dart';
import '../../app/bottom_sheets/catalogs_bottomsheet.dart';
import '../../app/bottom_sheets/delete_products_catalog_bottomsheet.dart';
import '../../app/bottom_sheets/incomplete_profile_bottomsheet.dart';
import '../../app/bottom_sheets/new_catalog_bottomsheet.dart';
import '../../app/bottom_sheets/select_variant_size.dart';
import '../../app/bottom_sheets/signout_bottomsheet.dart';
import '../../app/bottom_sheets/verify_phone_back.dart';
import 'types.dart';

class StaticBottomSeet extends StatelessWidget {
  const StaticBottomSeet({required this.type, super.key});
  final BottomSheetTypes type;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Material(
        color: Colors.white,
        child: SafeArea(
          top: false,
          child: getBottomSheet(type),
        ),
      ),
    );
  }

  Widget getBottomSheet(BottomSheetTypes type) {
    switch (type) {
      case BottomSheetTypes.newCatalog:
        return NewCatalogBottomsheet();

      case BottomSheetTypes.signOut:
        return SignOutBottomsheet();

      case BottomSheetTypes.authSignOut:
        return AuthSignOutBottomsheet();
      case BottomSheetTypes.verifyPhoneBack:
        return VerifyPhoneBack();
      case BottomSheetTypes.deleteProductsInCatalog:
        return DeleteProductsCatalogBottomsheet();
      case BottomSheetTypes.incompleteProfile:
        return IncompleteProfileBottomsheet();
      case BottomSheetTypes.share:
        return ShareBottomsheet();
      default:
        return SizedBox.shrink();
    }
  }
}
