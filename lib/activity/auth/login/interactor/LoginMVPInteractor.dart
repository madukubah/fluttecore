import 'package:fluttecore/base/interactor/MVPInteractor.dart';
import 'package:fluttecore/data/network/response/LoginResponse.dart';
import 'package:fluttecore/util/AppConstants.dart';

abstract class LoginMVPInteractor extends MVPInteractor
{
    Future<LoginResponse> doServerLoginApiCall( String identity,  String password );
    // void updateUserInSharedPref( LoginResponse loginResponse, LoggedInMode loggedInMode );
}