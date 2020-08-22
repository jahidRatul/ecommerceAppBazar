import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final ItemInfo item;
  ItemCard(this.item);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 300,
            child: Image.network(
              widget.item.imgUrl,
              width: 200,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            'Price: ' + widget.item.unitPrice,
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}

class ItemInfo {
  final String name;
  final String unitPrice;
  final String imgUrl;
  final String description;
  ItemInfo({this.unitPrice, this.imgUrl, this.description, this.name});
}
