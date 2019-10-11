import 'package:fluttecore/base/view/MVPView.dart';
import 'package:fluttecore/model/User.dart';
// import 'package:fluttecore/model/Group.dart';

abstract class ProfileMVPView extends MVPView {
  void showMessage( String message, int status );
  void showProgressCircle(  );
  void hideProgressCircle(  );
  void onUserLoad( User user );

}