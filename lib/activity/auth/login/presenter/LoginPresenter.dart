import 'dart:async';

import 'package:fluttecore/activity/auth/login/interactor/LoginMVPInteractor.dart';
import 'package:fluttecore/activity/auth/login/view/LoginMVPView.dart';
import 'package:fluttecore/base/presenter/BasePresenter.dart';
import 'package:fluttecore/data/network/response/LoginResponse.dart';
import 'package:fluttecore/util/AppConstants.dart';

import 'LoginMVPPresenter.dart';

class LoginPresenter< V extends LoginMVPView , I extends LoginMVPInteractor > extends BasePresenter< V, I > implements LoginMVPPresenter< V, I >
{
  LoginPresenter(I interactor) : super(interactor)
  {
    
  }

  @override
  void onServerLoginClicked(String phone, String password) {
      this.getView().showProgress();  

      interactor.doServerLoginApiCall( 
           phone,  password
      ).then(( LoginResponse loginResponse ){
        print( loginResponse );
        if( loginResponse == null ) return;

        interactor.updateUserInSharedPref( loginResponse, LoggedInMode.LOGGED_IN_MODE_SERVER );
        
        this.getView().showMessage( loginResponse.message, loginResponse.status );
        this.getView().hideProgress();  
        // print( "isUserLoggedIn ${ interactor.isUserLoggedIn() }" );
        if( loginResponse.status == 1 )
          this.getView().openMainAvtivity();  
      });
  }

  @override
  Future start() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, (){
        interactor.isUserLoggedIn().then( ( bool loggedIn ){
          print( "isUserLoggedIn ${ loggedIn }" );
          if( loggedIn ) this.getView().openMainAvtivity(  );
        } );
    });
  }
  
}