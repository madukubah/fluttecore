import 'package:fluttecore/activity/main/interactor/HomeMVPInteractor.dart';
import 'package:fluttecore/activity/main/view/HomeMVPView.dart';

abstract class HomeMVPPresenter < V extends HomeMVPView , I extends HomeMVPInteractor > 
{
    void logout(  );
    // void getGroups(  );
}