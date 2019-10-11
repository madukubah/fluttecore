import 'dart:io';

import 'package:fluttecore/data/network/response/LoginResponse.dart';
import 'package:fluttecore/model/Group.dart';
import 'package:fluttecore/model/User.dart';

import 'LoginRequest.dart';

abstract class ApiHelper
{
  Future<LoginResponse> performServerLogin( LoginRequest loginRequest );
  Future<dynamic> performServerRegister( Object registerData );
  Future<User> getUserCall( int userId );
  Future<List<Group>> getGroups();

  Future<LoginResponse> performServerUpdateUser( Object userData );
  Future<LoginResponse> performUserUploadImage( File image );
}