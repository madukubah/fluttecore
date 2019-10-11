
import 'package:fluttecore/activity/blank_page/interactor/BlankMVPInteractor.dart';
import 'package:fluttecore/activity/blank_page/view/BlankMVPView.dart';
import 'package:fluttecore/base/presenter/BasePresenter.dart';

import 'BlankMVPPresenter.dart';


class BlankPresenter < V extends BlankMVPView , I extends BlankMVPInteractor > extends BasePresenter< V, I > implements BlankMVPPresenter<V, I>
{
  BlankPresenter(BlankMVPInteractor interactor) : super(interactor);

  // @override
  // void onServerBlankClicked(Object registerData) {
  //   this.getView().showProgress();  
  //   interactor.doServerBlankApiCall( registerData ).then( ( dynamic response ){
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