  import 'package:bepsagent/login.dart';
  
  var getResponse;
  var postDevResponse;
  var getDevResponse;
  var body;
  var title;

//=================================================================================


  String loginUrl(){
    return 'http://192.168.0.116:8080/tms-api/oauth/token?client_id='+userInput+'&client_secret='+client_secret+'&device='+device+'&grant_type='+grant_type+'&deviceId='+deviceId+'&username='+username+'&password='+password;
  }

  var searchUrl = 'http://192.168.0.116:8080/tms-api/v2/user/find?username=store4';



  //= 'http://192.168.0.116:8080/tms-api/oauth/token?client_id='+userInput+'&client_secret='+client_secret+'&device='+device+'&grant_type='+grant_type+'&deviceId='+deviceId+'&username='+username+'&password='+password;


  var client_id = 'bepsnet18';
  var client_secret = 'beps';
  var device = 'web';
  var grant_type = 'password';
  var deviceId = '1002';
  var username = 'admin';
  var password = 'admin';

  var access_token;
  var token_type;
  var refresh_token;
  var expires_in;
  var scope;

  var email;

  //=================================================================================