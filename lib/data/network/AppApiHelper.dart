import 'dart:convert';
import 'dart:io';

import 'package:fluttecore/data/network/response/LoginResponse.dart';
import 'package:fluttecore/model/Group.dart';
import 'package:fluttecore/model/User.dart';
import 'package:fluttecore/util/fetch_data_exception.dart';
import 'package:mime/mime.dart';
import 'package:image_picker/image_picker.dart';

import 'ApiEndPoint.dart';
import 'ApiHelper.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;

class AppApiHelper extends ApiHelper 
{
  static final AppApiHelper _singleton = AppApiHelper._internal();
  AppApiHelper._internal();
  static AppApiHelper getInstance()
  {
    if( _singleton == null )
    {
      return new AppApiHelper._internal();
    }
    return _singleton;
  }
  Map<String, String> headers = {"Content-type": "application/json"};
  @override
  Future<LoginResponse> performServerLogin(loginRequest) async 
  {
    return http.post(ApiEndPoint.LOGIN, body: loginRequest.toJson() )
      .then(( http.Response response ){
          final String jsonBody = response.body;
          // //print( jsonBody );
          final statusCode = response.statusCode;
          if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
            throw new FetchDataException(
                "Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
          }
           final loginContainer = JsonDecoder().convert(jsonBody);
            // print( loginContainer['user_data']['phone'] );
          return LoginResponse.fromMap( loginContainer );
      });
  }

  @override
  Future<dynamic> performServerRegister(Object registerData) async {
    return http.post(ApiEndPoint.REGISTER, body: registerData )
      .then(( http.Response response ){
          final String jsonBody = response.body;
          // //print( jsonBody );
          final statusCode = response.statusCode;
          if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
            throw new FetchDataException(
                "Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
          }
          
          final container = JsonDecoder().convert(jsonBody);
          // print( container["message"] );

          return container;
      });
  }

  @override
  Future<List<Group>> getGroups() async {
    print( "getGroups" );
    return http.get(ApiEndPoint.GROUPS).then((http.Response response)  {
       final String jsonBody = response.body;
          // //print( jsonBody );
          final statusCode = response.statusCode;
          if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
            throw new FetchDataException(
                "Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
          }
          
          final container = JsonDecoder().convert(jsonBody);
          List<Group> groups = List();
          for (var i = 0; i < container.length; i++) 
          {
              groups.add( new Group.fromMap ( container[i] ) );
          }
          return groups;
   
    });
  }

  @override
  Future<User> getUserCall(int userId) async {
    return http.get(ApiEndPoint.GET_USER+"$userId").then((http.Response response)  {
       final String jsonBody = response.body;
          // //print( jsonBody );
          final statusCode = response.statusCode;
          if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
            throw new FetchDataException(
                "Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
          }
          final container = JsonDecoder().convert(jsonBody);

          return ( jsonBody == null ) ? null: new User.fromMap( container );
         
    });
  }

  @override
  Future<LoginResponse> performServerUpdateUser(Object userData) async {
    return http.post(ApiEndPoint.UPDATE_USER, body: userData )
      .then(( http.Response response ){
          final String jsonBody = response.body;
          // //print( jsonBody );
          final statusCode = response.statusCode;
          if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
            throw new FetchDataException(
                "Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
          }
          
          final container = JsonDecoder().convert(jsonBody);
          // print( container["message"] );
          return LoginResponse.fromMap( container );
      });
  }

  @override
  Future<LoginResponse> performUserUploadImage(File image) async {

    final mimeTypeData = lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');
    print( mimeTypeData );
    final imageUploadRequest = http.MultipartRequest('POST', Uri.parse( ApiEndPoint.USER_UPLOAD_IMAGE ));
    // Attach the file in the request
    final file = await http.MultipartFile.fromPath('image', image.path,
        // contentType: MediaType  );
        contentType: http_parser.MediaType(mimeTypeData[0], mimeTypeData[1]));

    imageUploadRequest.fields["user_id"] = "30";
    imageUploadRequest.files.add(file);
     try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode != 200) {
        return null;
      }

      final String jsonBody = response.body;
          //print( jsonBody );

      final container = JsonDecoder().convert(jsonBody);
      // _resetState();
      // return responseData;
      return LoginResponse.fromMap( container );
    } catch (e) {
      print(e);
      return null;
    }
  }
}