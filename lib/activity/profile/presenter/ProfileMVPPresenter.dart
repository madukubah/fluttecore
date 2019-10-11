import 'dart:io';

import 'package:fluttecore/activity/profile/interactor/ProfileMVPInteractor.dart';
import 'package:fluttecore/activity/profile/view/ProfileMVPView.dart';

abstract class ProfileMVPPresenter < V extends ProfileMVPView , I extends ProfileMVPInteractor > 
{
    // void onServerProfileClicked( Object registerData );
    void getUser(  );
    void updateUser( dynamic userData );
    void uploadImage(File image);
    // Future<Map<String, dynamic>> _uploadImage(File image);
}