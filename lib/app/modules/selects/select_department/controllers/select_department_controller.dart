import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../data/models/city/department/department.dart';
import '../../../../data/providers/repositories/selects/select_city_repository.dart';
import '../../../../routes/app_pages.dart';

class SelectDepartmentController extends GetxController {
  final SelectCityRepository _repository = SelectCityRepository();
  final List<DepartmentModel> _data = <DepartmentModel>[];
  List<DepartmentModel> get data => _data;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _responseError;
  String? get responseError => _responseError;

  // final RxList<ProductFirebaseModel> _list = <ProductFirebaseModel>[].obs;
  // List<ProductFirebaseModel> get list => _list.toList();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    print('onready');
    await getData();
    super.onReady();
  }

  Future<void> onTap(DepartmentModel department) async {
    final result = await Get.toNamed(Routes.SELECT_CITY, arguments: department);
    Get.back(result: [department, result]);
  }

  Future<void> getData() async {
    print('getData');

    _isLoading = true;
    _responseError = null;
    _data.clear();
    update(['tab1View']);

    Either<String, List<DepartmentModel>> response =
        await _repository.getDepartments();
    _isLoading = false;

    response.fold((error) {
      _responseError = error;
    }, (list) {
      _data.addAll(list);
    });
    update(['view']);
  }
}
