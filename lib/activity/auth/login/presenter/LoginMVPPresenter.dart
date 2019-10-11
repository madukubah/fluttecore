import 'package:fluttecore/base/interactor/MVPInteractor.dart';
import 'package:fluttecore/base/presenter/MVPPresenter.dart';
import 'package:fluttecore/base/view/MVPView.dart';

abstract class LoginMVPPresenter< V extends MVPView , I extends MVPInteractor > extends MVPPresenter< V, I >
{
  void onServerLoginClicked( String phone ,  String password );
  void start(  );
}