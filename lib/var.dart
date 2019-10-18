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
var trxResponse;
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

var userInput = '';
var passwordInput;
bool isLoading = false;
var trx;

bool btnSummary = true;
bool btnTrx = false;
List data;
List reversedData = data.reversed.toList();
DateTime _currentDate;

//=================================================================================

var imgBepsnet = 'assets/images/bepsnet.png';
var imgCashbac = 'assets/images/cashbac.jpg';
var imgCashbacBig = 'assets/images/cashbac_big.png';
var imgPaybyqr = 'assets/images/paybyqr.png';

//=================================================================================

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
  return 'https://192.168.4.26:8443/tms-5.0/v2/merchant-store/find?merchantGroupId=' +
      '$merchantId';
}

String getTrxUrl() {
  return 'https://192.168.4.26:8443/tms-5.0/v2/txn-log/getAllLogTrxByMerchantV2?merchantId=' +
      '$merchantId';
}

//=================================================================================

endSession() {
  access_token = null;
  merchantName = null;
}
