import 'dart:io';

import 'package:fluttecore/base/interactor/MVPInteractor.dart';
import 'package:fluttecore/data/network/response/LoginResponse.dart';
import 'package:fluttecore/model/User.dart';

abstract class ProfileMVPInteractor extends MVPInteractor {
  // Future<dynamic> doServerProfileApiCall( Object registerData );
  Future<User> getUser(int userId);
  int getUserId();
  
  Future<LoginResponse> doServerUpdateUser( Object userData );
  Future<LoginResponse> doUploadImage(File image);
}