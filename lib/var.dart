var client_id = 'bepsnet18';
var client_secret = 'beps';
var device = 'web';
var grant_type = 'password';
var deviceId = '1002';
var username = '';
var password = '';

var getResponse;
var getDevResponse;
var postDevResponse;
var merchantResponse;
var getMerchantResponse;
var body;
var title;

var access_token;
var token_type;
var refresh_token;
var expires_in;
var scope;

var email;
var merchantId;
var merchantName;

var userInput='';
var passwordInput;
bool isLoading = false;



//=================================================================================

// usernameField() {
//   if ('$userInput' != null) {
//     return '';
//   }
//   else
//   return '$userInput';
// }


String loginUrl() {
  return 'https://192.168.4.26:8443/tms-5.0/oauth/token?client_id=' +
      client_id +
      '&client_secret=' +
      client_secret +
      '&device=' +
      device +
      '&grant_type=' +
      grant_type +
      '&deviceId=' +
      deviceId +
      '&username=' +
      userInput +
      '&password=' +
      passwordInput;
}

String userInfoUrl() {
  return 'https://192.168.4.26:8443/tms-5.0/v2/user/find?username=' + userInput;
}

String merchantInfoUrl() {
  return 'https://192.168.4.26:8443/tms-5.0/v2/merchant-store/find?merchantGroupId=52046';
}

//=================================================================================

//  Future<String> check({ String urlD, Map<String, String> headerHttp, SHA sha, List<String> allowedSHAFingerprints, int timeout }) async {
//   final Map<String, dynamic> params = <String, dynamic>{
//     "url" : 'https://192.168.4.26:8443/tms-5.0/oauth/token?client_id=bepsnet18&client_secret=beps&device=web&grant_type=password&deviceId=1002&username=admin&password=admin',
//     "headers" : {'Accept': 'application/json'}, body: json.encode({}),
//     "type": sha.toString().split(".").last,
//     "fingerprints" : allowedSHAFingerprints,
//     "timeout" : 30
//   };
//   String resp = await _channel.invokeMethod('check', params);
//   return resp;
// }
