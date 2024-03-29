import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_car/constants/assets_constants.dart';
import 'package:rent_car/constants/bottom_nav_bar.dart';
import 'package:rent_car/pages/home_screen.dart';
import 'package:rent_car/main.dart';
import 'package:rent_car/service/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController userNameCntrl = TextEditingController();
  final TextEditingController emailCntrl = TextEditingController();
  final TextEditingController passwordCntrl = TextEditingController();
  final TextEditingController passwordCheckCntrl = TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        _buildImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              child: Column(children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 65),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                _builEmail(),
                const SizedBox(height: 30),
                _buildUsername(),
                const SizedBox(height: 30),
                _buildpassword(),
                const SizedBox(height: 30),
                _checkPassword(),
                //SizedBox(height: 5),
                _buildLoginButton(),
              ]),
            ),
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
              controller: emailCntrl,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.blueGrey,
                ),
                hintText: 'Email',
                hintStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
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
            margin: const EdgeInsets.only(left: 6.0, top: 15.0),
            child: const Text(
              'Username: ',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.only(left: 1.0, right: 50.0),
            child: TextField(
              controller: userNameCntrl,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.blueGrey,
                  ),
                  hintText: 'Username',
                  hintStyle: const TextStyle(color: Colors.white),
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
            margin: const EdgeInsets.only(left: 6.0, top: 15.0),
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
            margin: const EdgeInsets.only(left: 1.0, right: 50.0),
            child: TextField(
              controller: passwordCntrl,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.blueGrey,
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.white),
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
              controller: passwordCheckCntrl,
              obscureText: true,
              //keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.blueGrey,
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
            _authService
                .createUser(
                    userNameCntrl.text, emailCntrl.text, passwordCntrl.text)
                .then((value) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBarWidget(),
                  ));
            });
          },
          height: 45,
          color: Colors.white,
          child: Text(
            "Sign up",
            style: TextStyle(
              color: Colors.blueGrey,
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
