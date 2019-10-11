

import 'package:fluttecore/activity/auth/register/interactor/RegisterMVPInteractor.dart';
import 'package:fluttecore/activity/auth/register/view/RegisterMVPView.dart';

abstract class RegisterMVPPresenter < V extends RegisterMVPView , I extends RegisterMVPInteractor > 
{
    void onServerRegisterClicked( Object registerData );
    void getGroups(  );
}