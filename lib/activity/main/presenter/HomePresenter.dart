
import 'package:fluttecore/activity/main/interactor/HomeMVPInteractor.dart';
import 'package:fluttecore/activity/main/view/HomeMVPView.dart';
import 'package:fluttecore/base/presenter/BasePresenter.dart';

import 'HomeMVPPresenter.dart';


class HomePresenter < V extends HomeMVPView , I extends HomeMVPInteractor > extends BasePresenter< V, I > implements HomeMVPPresenter<V, I>
{
  HomePresenter(HomeMVPInteractor interactor) : super(interactor);

  @override
  void logout() {
    interactor.performUserLogout();
    interactor.isUserLoggedIn().then( ( bool loggedIn ){
      print( "loggedIn $loggedIn" );
      if( !loggedIn ) 
        this.getView().toLoginPage(  );
    } );
  }

  // @override
  // void onServerHomeClicked(Object registerData) {
  //   this.getView().showProgress();  
  //   interactor.doServerHomeApiCall( registerData ).then( ( dynamic response ){
  //       if( response["message"] == null ) return;

  //       this.getView().hideProgress();  
  //       int status = response["status"];//int.parse( response["status"] );
  //       String message =  response["message"];
  //       this.getView().showMessage( message.trimRight().trimLeft(), status );
        
  //   });
  //   print( registerData );
  // }

  // @override
  // void getGroups() {
  //   // this.getView().showProgress(); 
  //   interactor.getGroups().then(( List<Group> groups ){
  //     print( groups[0].name ); 
  //     this.getView().attachGroups( groups );
  //     // return groups;  
  //   });
  // }
  
}