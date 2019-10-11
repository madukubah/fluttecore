import 'package:fluttecore/base/view/MVPView.dart';
// import 'package:fluttecore/model/Group.dart';

abstract class HomeMVPView extends MVPView {
  void showMessage( String message, int status );
  void toLoginPage(  );
}