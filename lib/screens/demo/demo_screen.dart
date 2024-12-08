import 'package:ex/commom_widget/primary_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PrimaryAppBar(
          title: 'SingChildScrollView',
          onBack: () {},
        ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: 100,
            color: Colors.red,
          ),
      Container(
        height: 100,
        color: Colors.green,
      ),
      Container(
        height: 100,
        color: Colors.blue,
      ),
          Container(
            height: 100,
            color: Colors.white,
          ),


        ],
      ),
       );
  }
}
