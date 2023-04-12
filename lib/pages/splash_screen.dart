import 'package:flutter/material.dart';
import 'package:rent_car/constants/assets_constants.dart';
//import 'package:rent_car/bottom_nav_bar.dart';
import 'package:rent_car/sign_up_page.dart';
import 'package:rent_car/constants/text_constants.dart';

import 'login_page.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _backgroundImageAsset(size),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _skipButton(TextConstants().skipButtonText),
                      const SizedBox(height: 20),
                      _splashTitleText(),
                      const SizedBox(height: 20),
                      _splashSubtitleText(size),
                    ],
                  ),
                ),
                _buttomWhiteContainer(size, context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _splashSubtitleText(Size size) {
    return Container(
      //Ekran genişliğinin tamamını kullanmasın
      constraints: BoxConstraints(maxHeight: size.width * 0.6),
      child: const Text(
        TextConstants.splashSubtitleText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Text _splashTitleText() {
    return Text(
      TextConstants().splashTitleText,
      style: const TextStyle(color: Colors.white, fontSize: 50),
    );
  }

  Expanded _buttomWhiteContainer(Size size, BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: size.width,
          height: size.height * .23,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            _startedButton(size, context),
            _loginButton(context),
          ]),
        ),
      ),
    );
  }

  Row _loginButton(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(TextConstants.alreadyHave),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
            child: const Text(
              TextConstants.login,
              style: TextStyle(color: Colors.blue),
            )),
      ],
    );
  }

  Widget _startedButton(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => SignUpPage()), (route) => false);
      },
      child: Card(
        elevation: 6,
        color: Color(0xff292f3b),
        child: SizedBox(
          height: 60,
          width: size.width * 0.8,
          child: Center(
            child: Wrap(
              spacing: 10,
              children:

                  /* */
                  [
                Text(TextConstants.letsStarted,
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],

              /*  */
            ),
          ),
        ),
      ),
    );
  }

  Align _skipButton(String text) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Image _backgroundImageAsset(Size size) {
    return Image.asset(
      AssetPathConstants().loginAssetPath,
      height: size.height,
      width: size.width,
      fit: BoxFit.cover,
    );
  }
}


/*
[
                Text(TextConstants.letsStarted,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary)),
                Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
              
              
              
              */