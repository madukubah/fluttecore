import 'package:fluttecore/base/interactor/MVPInteractor.dart';
import 'package:fluttecore/model/Group.dart';

abstract class RegisterMVPInteractor extends MVPInteractor {
  Future<dynamic> doServerRegisterApiCall( Object registerData );
  Future<List<Group>> getGroups();
  
}