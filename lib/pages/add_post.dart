import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:news_app/sup_base.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  var cons = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  var isRTL = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    AlertDialog alert = AlertDialog(
      content: Container(
        width: size.width * 0.8,
        height: 100,
        child: Column(
          children: [
            Spacer(flex: 1),
            Text('Fill the feilds'),
            Spacer(
              flex: 2,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'))
          ],
        ),
      ),
    );
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(60, 40), primary: Colors.deepOrange, elevation: 0),
        onPressed: () async {
          if (cons[0].text == '' || cons[1].text == '')
            showDialog(
                context: context,
                builder: (con) {
                  return alert;
                });
          else {
            await SupBase.addPost(
                image: cons[2].text==''?null:cons[2].text,
                title: cons[0].text,
                post: cons[1].text,
                dir: isRTL ? 'rtl' : 'ltr');
            setState(() {});
            Navigator.push(
                context, MaterialPageRoute(builder: (con) => HomeScreen()));
          }
        },
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text('Add Post', style: TextStyle(color: Colors.deepOrange)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cons[0],
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    prefixIcon: Icon(Icons.subject, color: Colors.deepOrange),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cons[2],
                decoration: InputDecoration(
                    labelText: 'Image Link(optinal)',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    prefixIcon: Icon(Icons.photo_camera_sharp,
                        color: Colors.deepOrange),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90))),
              ),
            ),
            Text('rtl'),
            Switch(
                value: isRTL,
                onChanged: (newValue) {
                  setState(() {
                    isRTL = newValue;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cons[1],
                maxLines: 30,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
