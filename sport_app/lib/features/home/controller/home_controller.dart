import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_app/features/home/service/home_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../models/data_models.dart';

class HomeController extends ChangeNotifier {
  final _homeService = locator<HomeService>();

  bool showLoading = false;
  List<Types> types = [];

  Types? selectedType;

  selectType(Types selectedType) {
    this.selectedType = selectedType;
    notifyListeners();
  }

  Future<void> getData() async {
    showLoading = true;
    notifyListeners();
    try {
      var data = await _homeService.getData();
      if (data.types != null) {
        types = data.types!;
        selectedType = types.first;
      }
    } catch (e) {
      print(e.toString());
    }

    showLoading = false;
    notifyListeners();
  }
}

final homeControllerProvider = ChangeNotifierProvider<HomeController>((ref) {
  return HomeController();
});
