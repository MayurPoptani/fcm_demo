import 'package:firebase_fcm_integration_demo/FcmIntegration.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeFCM();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: controller,
            ),
            SizedBox(height: 16,),
            TextField(
              controller: type,
              enabled: false,
              decoration: InputDecoration(
                labelText: "NOTIFICATION RECIEVE TYPE"
              ),
            ),
            SizedBox(height: 16,),
            TextField(
              controller: title,
              enabled: false,
              decoration: InputDecoration(
                labelText: "NOTIFICATION MESSAGE TITLE"
              ),
            ),
            SizedBox(height: 16,),
            TextField(
              controller: message,
              enabled: false,
              decoration: InputDecoration(
                labelText: "NOTIFICATION MESSAGE BODy"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
