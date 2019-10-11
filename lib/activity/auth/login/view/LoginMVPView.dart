import 'package:fluttecore/base/view/MVPView.dart';

abstract class LoginMVPView extends MVPView
{
    void showValidationMessage( int errorCode );
    void showMessage( String message, int status );
    void openMainAvtivity(  );
}