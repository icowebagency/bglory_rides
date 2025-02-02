import 'package:bglory_rides/utils/secret/api_constants.dart';
import '../api/rider_api_client.dart';

class RiderProfileRepository {

  final RiderApiClientContract _clientContract;

  RiderProfileRepository({required RiderApiClientContract clientContract}) :
        _clientContract = clientContract;

  Future getRiderProfile(String token) async {
    final result = await _clientContract.getRiderProfile(token: token);
    if(result is Success) {
      final data = result.data["data"];
      print(data);
      return Success(data: data);
    } else {
      return result;
    }
  }

  Future editRiderProfile() async {}
}