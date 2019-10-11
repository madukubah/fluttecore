

import 'package:fluttecore/base/interactor/MVPInteractor.dart';
import 'package:fluttecore/base/view/MVPView.dart';

abstract class MVPPresenter < V extends MVPView , I extends MVPInteractor > 
{
  void onAttach( V view );
  void onDetach(  );
  V getView(  );
}