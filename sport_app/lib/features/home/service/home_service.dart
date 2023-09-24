import 'package:sport_app/features/home/models/data_models.dart';
import '../../../core/data/network/api_manager.dart';
import '../../../core/data/requests/data_requests.dart';
import '../../../core/service_locator/service_locator.dart';

class HomeService {
  final _apiManager = locator<APIManager>();

  Future<DataResponse> getData() async {
    final request = DataRequests.getData.request();

    try {
      final Map<String, dynamic> response = await _apiManager.call(request);

      final DataResponse dataResponse = DataResponse.fromJson(response);

      return dataResponse;
    } catch (e) {
      rethrow;
    }
  }
}
