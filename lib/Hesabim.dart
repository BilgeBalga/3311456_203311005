import 'package:flutter/material.dart';
import 'GirisEkrani.dart';

class Hesabim extends StatelessWidget {
  const Hesabim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Hesabım",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            //  fontSize: 20,
          ),
        ),
      ),
      body:  Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25),
          width: double.infinity,
          child: RaisedButton(
            elevation: 5,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GirisEkrani()));
            },
            color: Colors.red,
            child: Text(
              'Çıkış Yap',
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
