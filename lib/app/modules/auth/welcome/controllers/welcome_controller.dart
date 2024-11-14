import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/data/models/carrousel/carrousel_model.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  MainController mainController = Get.find();

  List<CarrouselModel> _list = [];
  List<CarrouselModel> get list => _list;

  RxInt currentStep = 0.obs;
  PageController pageController = PageController();

  @override
  void onInit() {
    _list.add(
      CarrouselModel(
        id: 0,
        title: '¡Te damos la bienvenida!',
        subtitle: 'Descubre productos exclusivos para comprar y vender',
        image: 'assets/images/welcome1.png',
      ),
    );
    _list.add(
      CarrouselModel(
        id: 1,
        title: 'Comparte, conecta, vende',
        subtitle:
            'Crea tu tienda digital, comparte y deja que tus productos se vendan por sí solos.',
        image: 'assets/images/welcome2.png',
      ),
    );
    _list.add(
      CarrouselModel(
        id: 2,
        title: '¡Gana más con menos esfuerzo!',
        subtitle: 'Gana puntos y canjéalos por beneficios y premios.',
        image: 'assets/images/welcome3.png',
      ),
    );

    super.onInit();
  }

  void onPageChanged(int? value) {
    currentStep.value = value ?? 1;
  }
}
