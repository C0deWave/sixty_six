import 'package:location/location.dart';
import 'http_to_json.dart';

class LocationApi {
  Future<LocationData> getLocation() async {
    Location location = new Location();

    late bool _serviceEnabled;
    late PermissionStatus _permissionGranted;
    late LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print('권한을 받지 못했습니다.');
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("권한2를 받지 못했습니다.");
      }
    }

    _locationData = await location.getLocation();
    print(_serviceEnabled);
    print(_permissionGranted);
    print(_locationData.latitude);
    print(_locationData.longitude);
    print(_locationData.accuracy);
    print(_locationData.altitude);
    return _locationData;
  }

  Future<String> getAddressData() async {
    var data = await getLocation();
    String jsonResult = await HttpToJson.makeGetRequest(
        "https://dapi.kakao.com/v2/local/geo/coord2address.json?y=${data.latitude}&x=${data.longitude}&input_coord=WGS84",
        {
          "Authorization": "KakaoAK 14e3a28f47404bb8b72d00726a1cc5db",
          "Content-type": "application/json"
        });
    print(jsonResult);
    return jsonResult;
  }
}
