import 'package:flutter/material.dart';
import '../../template/tab_page/TabsPage.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState(  );
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: new AppBar(
        title: new Text( 'Home' ),
      ),
      body: new Center(
        child: new Text('Welcome to Home.!'),
      ),
    );
  }
}