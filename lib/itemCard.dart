import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final List list;
  final int index;
  ItemCard({this.index, this.list});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int _n = 1;
  void minus() {
    setState(() {
      if (_n != 1) _n--;
    });
  }

  void add() {
    setState(() {
      _n++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Image.network(
                  'http://siteonline.biz/androidec/' +
                      widget.list[widget.index]["thumbnail_img"],
                  width: 300,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.list[widget.index]["name"],
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Price: ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    widget.list[widget.index]["unit_price"],
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Quantity: '
                    '',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: minus,
                        splashColor: Colors.redAccent.shade200,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.remove,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            '$_n',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap: add,
                        splashColor: Colors.greenAccent.shade200,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Price: ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    (double.parse(widget.list[widget.index]["unit_price"]) * _n)
                        .toString(),
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: RaisedButton(
                  color: Colors.deepPurpleAccent,
                  onPressed: () {
                    print(_n);
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
