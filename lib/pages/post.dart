import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  Post(
      {required this.name,
      required this.post,
      required this.dir,
      required this.img});
  final String name, post, dir;
  final img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name, style: TextStyle(color: Colors.deepOrange)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment:
                    dir == 'rtl' ? Alignment.topRight : Alignment.topLeft,
                child: SelectableText(
                  post,
                  style: TextStyle(letterSpacing: 5, fontSize: 16),
                  textAlign: dir == 'rtl' ? TextAlign.right : TextAlign.left,
                  textDirection:
                      dir == 'rtl' ? TextDirection.rtl : TextDirection.ltr,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: renderImage(),
            )
          ],
        ),
      ),
    );
  }

  renderImage() {
    if (img != null) {
      return Image.network(img);
    }
    return Text('');
  }
}
