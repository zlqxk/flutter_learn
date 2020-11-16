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
      routes: {
        "new_router": (context) => NewRouter(),
        "/": (context) => MyHome(),
        "tip_router": (context) => TipRouter()
      },
    );
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('count is $_count'),
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "new_router");
              },
              textColor: Colors.blue,
              child: Text('点击跳转NewRouter')),
          RaisedButton(
              onPressed: () async {
                final res = await Navigator.of(context)
                    .pushNamed("tip_router", arguments: "我是参数");
                print(res);
              },
              textColor: Colors.blue,
              child: Text('点击跳转TipRouter'))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        tooltip: '点击增加',
        child: Icon(Icons.add),
      ),
    );
  }
}

class NewRouter extends StatelessWidget {
  const NewRouter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new router'),
      ),
      body: Center(
        child: Text('new router'),
      ),
    );
  }
}

class TipRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('TipRouter'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("$args"),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context, "我是返回值");
            },
            child: Text("返回"),
          )
        ],
      )),
    );
  }
}
