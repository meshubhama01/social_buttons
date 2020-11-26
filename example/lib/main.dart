import 'package:flutter/material.dart';
import 'package:social_buttons/social_buttons.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: SocialButtons(
              items: [
                SocialButtonItem(
                    socialItem: socialItems.twitter,
                    itemColor: Colors.blue[400],
                    itemSize: 30.0,
                    url: "https://www.google.com/"),
                SocialButtonItem(
                    socialItem: socialItems.instagram,
                    itemColor: Colors.pink[800],
                    itemSize: 30.0,
                    url: "https://www.google.com/"),
                SocialButtonItem(
                    socialItem: socialItems.facebook,
                    itemColor: Colors.blue[900],
                    itemSize: 30.0,
                    url: "https://www.google.com/"),
                SocialButtonItem(
                    socialItem: socialItems.snapchat,
                    itemColor: Colors.yellow[700],
                    itemSize: 30.0,
                    url: "https://www.google.com/")
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
