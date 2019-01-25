import 'package:flutter/material.dart';

class RankPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RankState();
}

class RankState extends State<RankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "排行榜",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: PreferredSize(
            child: Container(
              margin: EdgeInsets.only(bottom: 50.0),
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildRichText("26", "名"),
                  Image.asset(
                    "images/ic_avatar.png",
                    width: 50.0,
                    height: 50.0,
                  ),
                  _buildRichText("245", "分"),
                ],
              ),
            ),
            preferredSize: Size(double.infinity, 200.0)),
      ),
    );
  }

  Widget _buildRichText(String text1, String text2) {
    return RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: text1, style: TextStyle(fontSize: 22, color: Colors.white)),
      TextSpan(text: text2, style: TextStyle(fontSize: 14, color: Colors.white))
    ]));
  }
}
