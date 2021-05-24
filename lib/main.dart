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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.circle, color: Colors.green, size: 30,),
            Icon(Icons.clear, color: Colors.red, size:30,),
            Text('ゲーム')
          ],
        ),
      ),
      body: buildField(),
    );
  }

  Column buildField() {
    //縦３列を作成するリスト
    List<Widget>_columnChildren = [];
    //横３列を作成するリスト
    List<Widget>_rowChildren = [];

    for(int h = 0; h < 3; h++) {
      //横の行作成
      for(int i = 0; i < 3; i++) {
        _rowChildren.add(
          Expanded(child: AspectRatio(
              aspectRatio: 1.0,
              child: i == 2 ?
              Container()
                  : Row(
                children: [
                  Expanded(child: Container()),
                  VerticalDivider(width: 0.0, color: Colors.black,),
                ],
              )
          )
          ),
        );
      }

      _columnChildren.add(Row(children: _rowChildren,));
      _columnChildren.add(Divider(height: 0.0, color: Colors.black,));

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
