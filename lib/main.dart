import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sowda Bazar',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List> getData() async {
    final response =
        await http.get("http://siteonline.biz/androidec/getProduct.php");

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
//          print(snapshot.data);
          return snapshot.hasData
              ? ItemList(list: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
//        itemCount: list == null ? 0 : list.length,
        itemCount: 16,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, i) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                child: Card(
                  child: Column(
                    children: [
                      Image.network(
                        'http://siteonline.biz/androidec/' +
                            list[i]["thumbnail_img"],
                        width: 200,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                      Text(list[i]["unit_price"]),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
