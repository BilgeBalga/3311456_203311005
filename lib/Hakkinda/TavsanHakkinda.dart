
import 'package:flutter/material.dart';

class TavsanHakkinda extends StatelessWidget {
  const TavsanHakkinda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(),
          buildTavsan(),
          buildTavsanDetay(),
        ],
      ),
    );
  }
}

Widget buildTavsan() {
  return Container(
    color: Colors.greenAccent,
    height: 200,
    child: Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Image.asset(
            'images/tavsan.jpg',
            height: 300,
            width: 200,
          ),
        ),
      ],
    ),
  );
}

Widget buildTavsanDetay() {
  return Container(
    color: Colors.greenAccent,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Havuç",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 30.0,
                    color: Colors.black),
              ),
              Icon(
                Icons.female_rounded,
                color: Colors.purpleAccent,
                size: 30,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Avrupa Ada Tavşanı",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              Text(
                "4 Yaşında",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.purple,
                size: 30,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "Antalya",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
