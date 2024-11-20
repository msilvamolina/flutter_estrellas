import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../widgets/photo_card_empty.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: 'Editar perfil'),
      body: PhotoCardEmpty(),
    );
  }
}
