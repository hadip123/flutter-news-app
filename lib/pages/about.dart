import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About', style: TextStyle(color: Colors.deepOrange)),
      ),
      body: Center(
        child: Text(
          'Nothing to show!',
          style: TextStyle(color: Colors.deepOrange, fontSize: 20),
        ),
      ),
    );
  }
}
