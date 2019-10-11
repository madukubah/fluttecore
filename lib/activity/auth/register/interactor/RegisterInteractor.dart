import 'package:fluttecore/base/interactor/BaseInteractor.dart';
import 'package:fluttecore/data/network/ApiHelper.dart';
import 'package:fluttecore/data/preferences/PreferenceHelper.dart';
import 'package:fluttecore/model/Group.dart';

import 'RegisterMVPInteractor.dart';

class RegisterInteractor extends BaseInteractor implements RegisterMVPInteractor
{
  RegisterInteractor(PreferenceHelper preferenceHelper, ApiHelper apiHelper) : super(preferenceHelper, apiHelper);

  @override
  Future<dynamic> doServerRegisterApiCall(Object registerData) async {
    return apiHelper.performServerRegister(registerData).then( ( dynamic response ){
        // final responsea = JsonDecoder().convert( response );
        print( response["message"] );
        return response;
    });
  }

  @override
  Future<List<Group>> getGroups()  {
    return apiHelper.getGroups().then(( List<Group> groups ){
      // print( groups[0].name );      
      return groups;  
    });
  }
  

}