import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
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
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool turnOfCircle = true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.circle,),
            Icon(Icons.clear,),
            Text('ゲーム')
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    turnOfCircle ? Icon(FontAwesomeIcons.circle) : Icon(Icons.clear),
                    Text('の番です'),
                  ],
                ),
                OutlineButton(
                  borderSide: BorderSide(),
                  child: Text('クリア'),
                  onPressed: () {

                  },
                )
              ],
            ),
          ),
          buildField(),
        ],
      ),
    );
  }

  Widget buildField() {
    //縦３列を作成するリスト
    List<Widget>_columnChildren = [Divider(height: 0.0, color: Colors.black,)];
    //横３列を作成するリスト
    List<Widget>_rowChildren = [];

    for(int j = 0; j < 3; j++) {
      //横の行作成
      for(int i = 0; i < 3; i++) {
        _rowChildren.add(
          Expanded(
              child: InkWell(
                onTap:  () {
                  turnOfCircle = !turnOfCircle; //◯×切り替え
                  setState(() {

                  });
                },
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Row(
                    children: [
                        Expanded(child: Container()),
                      (i == 2) ? Container() : VerticalDivider(width: 0.0, color: Colors.black,),
                  ],
                )
          ),
              )
          )
        );
      }

      _columnChildren
      ..add(Row(children: _rowChildren,))
      ..add(Divider(height: 0.0, color: Colors.black,));

      _rowChildren = [];
    }

    return Column(children: _columnChildren,);
  }
}

//todo アプリのタイトル変更
//todo フィールドのUIを作成
//todo フィールドのUI作成をメソッドを用いて簡潔に
//todo ターン表示とクリアボタンの作成
//todo マス目をタップ可能にし、タップ時にターン切り替え
//todo マス目タップでマルバツを表示
//todo ゲームの勝者のパターンを書き出す
//todo ゲームの勝敗を判定可能に
//todo リセットボタンタップでリスタート可能に
