import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'constants/bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        _buildImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 65),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              _builEmail(),
              SizedBox(height: 30),
              _buildUsername(),
              SizedBox(height: 30),
              _buildpassword(),
              SizedBox(height: 30),
              _checkPassword(),
              //SizedBox(height: 5),
              _buildLoginButton(),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/softBackground.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _builEmail() {
    return Container(
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 6.0, top: 15.0),
            child: const Text(
              'Email: ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(left: 1.0, right: 50.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.black87,
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: new BorderSide(color: Colors.white)),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildUsername() {
    return Container(
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 6.0, top: 15.0),
            child: const Text(
              'Username: ',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(left: 1.0, right: 50.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black87,
                  ),
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildpassword() {
    return Container(
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 6.0, top: 15.0),
            child: const Text(
              'Password: ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(left: 1.0, right: 50.0),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.black87,
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _checkPassword() {
    return Container(
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 6.0, top: 15.0),
            child: const Text(
              'Password Check: ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(left: 1.0, right: 50.0),
            child: TextField(
              obscureText: true,
              //keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.black87,
                  ),
                  hintText: 'Password Check',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      //width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavBarWidget(),
                ));
          },
          height: 45,
          color: Colors.white,
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
