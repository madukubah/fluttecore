import 'dart:io';

import 'package:fluttecore/base/interactor/BaseInteractor.dart';
import 'package:fluttecore/data/network/ApiHelper.dart';
import 'package:fluttecore/data/network/response/LoginResponse.dart';
import 'package:fluttecore/data/preferences/PreferenceHelper.dart';
import 'package:fluttecore/model/User.dart';

import 'ProfileMVPInteractor.dart';

class ProfileInteractor extends BaseInteractor implements ProfileMVPInteractor
{
  ProfileInteractor(PreferenceHelper preferenceHelper, ApiHelper apiHelper) : super(preferenceHelper, apiHelper);

  @override
  Future<User> getUser(int userId) async {

    return User(
       phone : preferenceHelper.getCurrentUserPhone() ,
       email:preferenceHelper.getCurrentUserEmail(),
       user_fullname : preferenceHelper.getCurrentUserName(),
       image:preferenceHelper.getCurrentUserImage(),
       group_name : preferenceHelper.getCurrentUserGroupName(),
       first_name : preferenceHelper.getCurrentUserFirstName(),
       last_name:preferenceHelper.getCurrentUserLastName(),
       address : preferenceHelper.getCurrentUserAddress()
    );
    //   return apiHelper.getUserCall(userId).then( ( User response ){
    //     return response;
    // });
  }

  @override
  int getUserId() {
    return preferenceHelper.getCurrentUserId();
  }

  @override
  Future<LoginResponse> doServerUpdateUser(Object userData) async {
    return apiHelper.performServerUpdateUser( userData ).then( ( LoginResponse loginResponse ){
      return loginResponse;
    } );
  }

  @override
  Future<LoginResponse> doUploadImage(File image) {
    return this.apiHelper.performUserUploadImage(image).then( ( LoginResponse loginResponse ) {
      return loginResponse;
    });
  }

}