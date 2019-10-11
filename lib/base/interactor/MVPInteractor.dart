import 'package:fluttecore/data/network/response/LoginResponse.dart';
import 'package:fluttecore/util/AppConstants.dart';

abstract class MVPInteractor {
  Future< bool > isUserLoggedIn(  );
  void performUserLogout(  );
  void updateUserInSharedPref( LoginResponse loginResponse, LoggedInMode loggedInMode );
}