import 'package:fluttecore/base/interactor/BaseInteractor.dart';
import 'package:fluttecore/data/network/ApiHelper.dart';
import 'package:fluttecore/data/preferences/PreferenceHelper.dart';

import 'HomeMVPInteractor.dart';

class HomeInteractor extends BaseInteractor implements HomeMVPInteractor
{
  HomeInteractor(PreferenceHelper preferenceHelper, ApiHelper apiHelper) : super(preferenceHelper, apiHelper);

  @override
  void doLogout() {
    
  }

  // @override
  // Future<dynamic> doServerHomeApiCall(Object registerData) async {
  //   return apiHelper.performServerHome(registerData).then( ( dynamic response ){
  //       // final responsea = JsonDecoder().convert( response );
  //       print( response["message"] );
  //       return response;
  //   });
  // }

  // @override
  // Future<List<Group>> getGroups()  {
  //   return apiHelper.getGroups().then(( List<Group> groups ){
  //     // print( groups[0].name );      
  //     return groups;  
  //   });
  // }
  

}