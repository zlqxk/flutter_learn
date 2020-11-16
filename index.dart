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
        home: Test());
  }
}

class Test extends StatelessWidget {
  const Test({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar'),
      ),
      body: Center(
        child: FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyHome();
              }));
            },
            textColor: Colors.blue,
            child: Text('点击跳转MyHome')),
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key, this.initVal = 0}) : super(key: key);
  final int initVal;

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.initVal;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('生命周期'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('count是$_count'),
            FlatButton(
              child: Text('增加count'),
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
