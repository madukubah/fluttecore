
import 'dart:io';

import 'package:fluttecore/activity/profile/interactor/ProfileMVPInteractor.dart';
import 'package:fluttecore/activity/profile/view/ProfileMVPView.dart';
import 'package:fluttecore/base/presenter/BasePresenter.dart';
import 'package:fluttecore/data/network/response/LoginResponse.dart';
import 'package:fluttecore/model/User.dart';
import 'package:fluttecore/util/AppConstants.dart';

import 'ProfileMVPPresenter.dart';


class ProfilePresenter < V extends ProfileMVPView , I extends ProfileMVPInteractor > extends BasePresenter< V, I > implements ProfileMVPPresenter<V, I>
{
  ProfilePresenter(ProfileMVPInteractor interactor) : super(interactor);

  @override
  void getUser() async {
    int userId = interactor.getUserId();
        print( userId );      
    // this.getView().showProgress();
    
    interactor.getUser( userId ).then( ( User response ){
        if( response == null ) return;

        print( response );
        this.getView().onUserLoad( response );
        // this.getView().hideProgress();
    });
  }

  @override
  void updateUser(dynamic userData ) {
    int userId = interactor.getUserId();
    userData["user_id"] = userId.toString();

    this.getView().showProgress();
    interactor.doServerUpdateUser( userData ).then( ( LoginResponse loginResponse ){
      if( loginResponse == null ) return;

      if( loginResponse.status == 1 )   
      {
        interactor.updateUserInSharedPref( loginResponse, LoggedInMode.LOGGED_IN_MODE_SERVER );
        this.getView().onUserLoad( loginResponse.user_data );
      }else{
        interactor.getUser( userId ).then( ( User response ){
            if( response == null ) return;

            print( response );
            this.getView().onUserLoad( response );
        });

      }

      this.getView().showMessage(  loginResponse.message, loginResponse.status);
      this.getView().hideProgress();
    } );
  }

  @override
  void uploadImage(File image) {
    int userId = interactor.getUserId();
    this.getView().showProgressCircle();
    interactor.doUploadImage( image ).then( ( LoginResponse loginResponse ) {
          if( loginResponse == null ) return;

          if( loginResponse.status == 1 )   
          {
            interactor.updateUserInSharedPref( loginResponse, LoggedInMode.LOGGED_IN_MODE_SERVER );
            this.getView().onUserLoad( loginResponse.user_data );
          }else{
            interactor.getUser( userId ).then( ( User response ){
                if( response == null ) return;

                print( response );
                this.getView().onUserLoad( response );
            });
          }
          this.getView().showMessage(  loginResponse.message, loginResponse.status);
          this.getView().hideProgressCircle();
    });
  } 
}