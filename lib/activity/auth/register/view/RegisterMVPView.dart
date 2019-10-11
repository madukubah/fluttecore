import 'package:fluttecore/base/view/MVPView.dart';
import 'package:fluttecore/model/Group.dart';

abstract class RegisterMVPView extends MVPView {
  void showMessage( String message, int status );
  void attachGroups( List<Group> groups );
}