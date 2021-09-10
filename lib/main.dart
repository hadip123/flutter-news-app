import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/about.dart';
import 'package:news_app/pages/add_post.dart';
import 'package:news_app/pages/post.dart';
import 'package:news_app/sup_base.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    theme: ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.deepOrange),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Color(0xFFFAFAFA))),
  ));
}

class HomeScreen extends StatelessWidget {
  firstStr(String text, int length) {
    var count = 1;
    var finalText = '';
    var lst = text.split('');
    for (var k in lst) {
      if (count == length) {
        finalText += k;
        break;
      } else {
        finalText = "$finalText$k";
        count++;
      }
    }
    return finalText;
  }

  @override
  Widget build(BuildContext context) {
    return _renderConnected(context);
  }

  _renderConnected(context) {
    return Scaffold(
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddPost()));
          },
          child: Text('Add Post!'),
          style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange,
              fixedSize: Size(100, 40),
              elevation: 0),
        ),
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              },
              icon: Icon(
                Icons.info_outline,
                color: Colors.deepOrange,
              ),
            ),
            title: Text(
              'NewsApp',
              style: TextStyle(color: Colors.deepOrange),
            )),
        body: FutureBuilder(
          future: SupBase.getPosts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final posts = snapshot.data.data;
              if (posts != [])
                return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (con, idx) {
                      return NewsTile(
                          title: posts[idx]['title'],
                          subTitle: firstStr(posts[idx]['post'], 20) + '...',
                          image: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.deepOrange,
                            backgroundImage: posts[idx]['img'] != null
                                ? NetworkImage(posts[idx]['img'])
                                : null,
                          ),
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (co) => Post(
                                          img: posts[idx]['img'],
                                          dir: posts[idx]['dir'],
                                          name: posts[idx]['title'],
                                          post: posts[idx]['post'],
                                        )));
                          });
                    });
              else if (posts == [])
                return Center(
                  child: Text(
                    'Nothing to show',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                );
            }
            if (snapshot.hasError) {
              return Center(
                  child: Icon(Icons.error, color: Colors.red, size: 80));
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class NewsTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onPress;
  final Widget image;
  const NewsTile({
    required this.title,
    required this.subTitle,
    required this.onPress,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: IconButton(
            onPressed: onPress,
            icon: RotatedBox(
              quarterTurns: 90,
              child: Icon(
                Icons.arrow_back_ios,
              ),
            )),
        leading: image);
  }
}
