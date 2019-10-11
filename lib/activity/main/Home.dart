import 'package:fluttecore/activity/main/presenter/HomePresenter.dart';
import 'package:fluttecore/activity/main/view/HomeMVPView.dart';
import 'package:fluttecore/data/network/AppApiHelper.dart';
import 'package:fluttecore/data/preferences/AppPreferenceHelper.dart';
import 'package:fluttecore/template/drawer/Menu.dart';
import 'package:fluttecore/template/drawer/PlainDrawer.dart';
import 'package:fluttecore/util/AppConstants.dart';
import 'package:flutter/material.dart';

import 'interactor/HomeInteractor.dart';
import 'interactor/HomeMVPInteractor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> implements HomeMVPView {

  HomePresenter<HomeMVPView, HomeMVPInteractor> presenter;

  _HomeState() {
    HomeInteractor interactor = HomeInteractor( AppPreferenceHelper.getInstance() , AppApiHelper.getInstance() );
    presenter = HomePresenter<HomeMVPView, HomeMVPInteractor>(interactor);
    this.presenter.onAttach(this);
  }

  List<Menu> menus = [
    Menu(title: "Usaha Saya", routename: "/Profile"),
    Menu(title: "Produk Saya", routename: "/Profile"),
    Menu(title: "Galeri", routename: "/Profile"),
    Menu(title: "Pengaturan", routename: "/Profile"),
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${AppConstants.APP_NAME}")),
      drawer: new PlainDrawer(
        menus: menus,
        onTap: ( Menu menu ){
            print( menu.routename );
            if( menu.routename == "/Logout" )
            {
              Navigator.pop(context);
              this.presenter.logout();
            }
            else
              Navigator.of(context).pushNamed( menu.routename );
        },
      ),
      body: new Container(),
    );
  }

  @override
  void hideProgress() {
    // TODO: implement hideProgress
  }

  @override
  void showMessage(String message, int status) {
    // TODO: implement showMessage
  }

  @override
  void showProgress() {
    // TODO: implement showProgress
  }

  @override
  void toLoginPage() {
    Navigator.of(context).pushReplacementNamed( "/LoginPage" );
  }
}
