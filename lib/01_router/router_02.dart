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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('count is $_count'),
          FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRouter();
                }));
              },
              textColor: Colors.blue,
              child: Text('点击跳转NewRouter')),
          RaisedButton(
              onPressed: () async {
                final res = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return TipRouter("我是TipRouter");
                }));
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
  final String text;
  const TipRouter(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TipRouter'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("$text"),
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
