import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:power_logger/power_logger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Dio().get("https://192.168.31.255:8888").catchError((e) {
      LoggerData.addData(e);
    });
    Dio().get("https://www.baidu.com", queryParameters: {'test': 'test'}).then(
        (e) {
      LoggerData.addData(e);
    });
    Dio().get("https://www.baidu.com/ahefbawfbe.html").catchError((e) {
      LoggerData.addData(e);
    });
    Future.delayed(
      Duration(milliseconds: 300),
      () => PowerLogger.init(context),
    );
    LoggerData.addData('TEST');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
