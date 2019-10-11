import 'package:fluttecore/activity/auth/register/interactor/RegisterMVPInteractor.dart';
import 'package:fluttecore/activity/auth/register/view/RegisterMVPView.dart';
import 'package:fluttecore/base/interactor/MVPInteractor.dart';
import 'package:fluttecore/base/presenter/BasePresenter.dart';
import 'package:fluttecore/model/Group.dart';

import 'RegisterMVPPresenter.dart';


class RegisterPresenter < V extends RegisterMVPView , I extends RegisterMVPInteractor > extends BasePresenter< V, I > implements RegisterMVPPresenter<V, I>
{
  RegisterPresenter(MVPInteractor interactor) : super(interactor);

  @override
  void onServerRegisterClicked(Object registerData) {
    this.getView().showProgress();  
    interactor.doServerRegisterApiCall( registerData ).then( ( dynamic response ){
        if( response["message"] == null ) return;

        this.getView().hideProgress();  
        int status = response["status"];//int.parse( response["status"] );
        String message =  response["message"];
        this.getView().showMessage( message.trimRight().trimLeft(), status );
        
    });
    print( registerData );
  }

  @override
  void getGroups() {
    // this.getView().showProgress(); 
    interactor.getGroups().then(( List<Group> groups ){
      print( groups[0].name ); 
      this.getView().attachGroups( groups );
      // return groups;  
    });
  }
  
}