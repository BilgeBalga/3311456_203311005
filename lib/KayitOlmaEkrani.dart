import 'package:flutter/material.dart';
import 'Anasayfa.dart';

class KayitOlmaEkrani extends StatelessWidget {
  const KayitOlmaEkrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'VETERİNERİM',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("VETERİNERİM"),
          backgroundColor: Colors.greenAccent,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    ("HOŞGELDİNİZ"),
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.black
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              _buildKullanici(),
              SizedBox(height: 30),
              _buildSifre(),
              SizedBox(height: 30),
              _buildSifreTekrar(),
              _buildKayitButon(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildKullanici() {
  return Container(
    child:Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              "Kullanıcı Adı : ",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(top: 20.0, right: 20.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.blue
                ),
                hintText: "Kullanıcı Adı Giriniz ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),

                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSifre() {
  return Container(
    child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              "Şifre : ",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(top: 20.0, right: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue
                ),
                hintText: "Şifre Giriniz ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSifreTekrar() {
  return Container(
    child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              "Tekrar Şifre : ",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(top: 20.0, right: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue
                ),
                hintText: "Şifre Giriniz ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildKayitButon(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => anasayfa()));
      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      color: Colors.greenAccent,
      child: Text(
        'Kayıt Ol',
        style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}

