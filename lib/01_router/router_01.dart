import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'router',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Container(
          child: MyHome(),
        ));
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _count = 0;
  void _add() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('router'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[Text('count is $_count')],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        tooltip: '点击增加',
        child: Icon(Icons.add),
      ),
    );
  }
}
