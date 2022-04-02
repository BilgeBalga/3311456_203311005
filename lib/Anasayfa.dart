import 'package:flutter/material.dart';

import 'Hakkinda/KediHakkinda.dart';
import 'Hakkinda/KopekHakkinda.dart';
import 'Hakkinda/KusHakkinda.dart';
import 'Hakkinda/TavsanHakkinda.dart';
import 'Hesabim.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({Key? key}) : super(key: key);

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Anasayfa",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: ()=>
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Hesabim())),
                  child: Container(
                    margin: EdgeInsets.zero,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('data:image/png;base64,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'
                          's0Q/mfAFuqFIDBNgP410Z8e/CfwQvihh3oW+gU/C4ARwE/ROQzYVQ0QBs/G7jnxH6IJuAapTefPAAAAAElFTkSuQmCC'),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 10),
            buildKedi(context),
            buildKopek(context),
            buildKus(context),
            buildTavsan(context),
          ],
        ),
      ),
    );
  }
}

Widget buildKedi(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Image.asset(
              'images/maya.jpeg',
              height: 130,
              width: 130,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            // margin: EdgeInsets.only(top: 20.0, right: 20.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => KediHakkinda()));
              },
              color: Colors.greenAccent,
              padding: EdgeInsets.only(),
              child: Text(
                'Maya Hakkında',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildKopek(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Image.asset(
              'images/kopek.jpeg',
              height: 120,
              width: 120,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            // margin: EdgeInsets.only(top: 20.0, right: 20.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => KopekHakkinda()));
              },
              color: Colors.greenAccent,
              padding: EdgeInsets.only(),
              child: Text(
                'Miti ile Tiki Hakkında',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildKus(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Image.asset(
              'images/kus.jpg',
              height: 120,
              width: 120,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            // margin: EdgeInsets.only(top: 20.0, right: 20.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => KusHakkinda()));
              },
              color: Colors.greenAccent,
              padding: EdgeInsets.only(),
              child: Text(
                'Boncuk Hakkında',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildTavsan(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Image.asset(
              'images/tavsan.jpg',
              height: 120,
              width: 120,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            // margin: EdgeInsets.only(top: 20.0, right: 20.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TavsanHakkinda()));
              },
              color: Colors.greenAccent,
              padding: EdgeInsets.only(),
              child: Text(
                'Havuç Hakkında',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

/* body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/maya.jpeg',
                height: 250,
                width: 250,
              ),
              Container(

              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/kopek.jpg',
                height: 200,
                width: 250,
              ),
              Container(
                child: Text("bilge"),
              ),
            ],
          ),
        ],
      ),*/

/*Widget buildHesabimCubugu(BuildContext context) {
  return Scaffold(body: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        // child: Align( alignment: Alignment.bottomCenter,
        child: Text(
          '                                          ANASAYFA',
          style: TextStyle(
            color: Colors.orangeAccent,
            // backgroundColor: Colors.blueGrey,
            fontSize: 20,
          ),
        ),
        //   ),
      ),
      InkWell(
        onTap: () =>
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Hesabim())),
        child: Container(
          margin: EdgeInsets.only(left: 275.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'data:image/png;base64,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'
                    's0Q/mfAFuqFIDBNgP410Z8e/CfwQvihh3oW+gU/C4ARwE/ROQzYVQ0QBs/G7jnxH6IJuAapTefPAAAAAElFTkSuQmCC'),
          ),
        ),
      ),
    ],
  ),
  );
}*/

/*
  Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        GirisEkrani(),
                  ),
                );
              },
              child: Icon(
                Icons.star,
                size: 40,
                color: Colors.greenAccent,
              ),
            ),
          ),
 */

/*
Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "Anasayfa",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          InkWell(
            onTap: () =>
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Hesabim())),
            child: Container(
              margin: EdgeInsets.only(left: 275.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'data:image/png;base64,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'
                        's0Q/mfAFuqFIDBNgP410Z8e/CfwQvihh3oW+gU/C4ARwE/ROQzYVQ0QBs/G7jnxH6IJuAapTefPAAAAAElFTkSuQmCC'),
              ),
            ),
          ),
        ],
        ),

      ),
    );
  }
}

 */

