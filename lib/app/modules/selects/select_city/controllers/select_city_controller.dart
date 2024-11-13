import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../data/models/city/city/city.dart';
import '../../../../data/models/city/department/department_model.dart';
import '../../../../data/providers/repositories/selects/select_city_repository.dart';

class SelectCityController extends GetxController {
  final SelectCityRepository _repository = SelectCityRepository();
  final List<CityModel> _data = <CityModel>[];
  List<CityModel> get data => _data;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _responseError;
  String? get responseError => _responseError;

  late DepartmentModel department;
  // final RxList<ProductFirebaseModel> _list = <ProductFirebaseModel>[].obs;
  // List<ProductFirebaseModel> get list => _list.toList();

  @override
  void onInit() {
    department = Get.arguments as DepartmentModel;
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getData();
    super.onReady();
  }

  void onTap(CityModel city) {
    Get.back(result: city);
  }

  Future<void> getData() async {
    print('getData');

    _isLoading = true;
    _responseError = null;
    _data.clear();
    update(['tab1View']);

    Either<String, List<CityModel>> response =
        await _repository.getCities(department.dropiId);
    _isLoading = false;

    response.fold((error) {
      _responseError = error;
    }, (list) {
      _data.addAll(list);
    });
    update(['view']);
  }
}
