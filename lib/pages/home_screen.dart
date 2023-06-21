import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rent_car/constants/assets_constants.dart';
import 'package:rent_car/pages/details_car.dart';
import 'package:rent_car/model/popular_cars_model.dart';
import 'package:rent_car/model/recommendation_cars_model.dart';
import 'package:rent_car/constants/text_constants.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          _headLineRow(TextConstants.popular),
          const SizedBox(height: 20),
          SizedBox(
            height: 200, //boyu verildi.
            child: ListView.builder(
              //physics: const NeverScrollableScrollPhysics(),
              itemCount: popularCars.length,
              scrollDirection: Axis.horizontal, //yan yana scroll sağladı
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Padding(
                  //Sayesinde aralarını açtım.
                  padding: const EdgeInsets.all(8.0),
                  child: _popularCarsCard(size, index),
                );
              }),
            ),
          ),
          _headLineRow(TextConstants.recommendation),
          Expanded(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: ReccomendationCars.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => DetailsWidget(
                                      image: ReccomendationCars[index].image,
                                      name: ReccomendationCars[index].name,
                                      location:
                                          ReccomendationCars[index].location,
                                      rating: ReccomendationCars[index].rating,
                                      price: ReccomendationCars[index].price,
                                    ))),
                          );
                        },
                        child: _RecommendationCarsCard(index)),
                  );
                }),
          ),
          // _RecommendationCarsCard(),
        ]),
      ),
    );
  }

  Container _RecommendationCarsCard(index) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _cardImage(index), //Inkwell ekleyebilirsin.
          _cardLocationInfoText(index),
          _HourPrice(index),
        ]),
      ),
    );
  }

  RichText _HourPrice(index) {
    return RichText(
      text: TextSpan(
          text: ReccomendationCars[index].price,
          style: const TextStyle(color: Colors.blue, fontSize: 17),
          children: const <TextSpan>[
            TextSpan(
              text: '/Hour',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ]),
    );
  }

  Column _cardLocationInfoText(index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(ReccomendationCars[index].name),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            const Icon(
              FontAwesomeIcons.locationDot,
              color: Colors.grey,
              size: 20,
            ),
            Text(ReccomendationCars[index].location),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.orange,
            ),
            Text(ReccomendationCars[index].rating),
          ],
        ),
      ],
    );
  }

  ClipRRect _cardImage(index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Image(
          image: AssetImage(
            ReccomendationCars[index].image,
          ),
        ),
      ),
      /* 
          Image.network(
        AssetPathConstants().recommendationImage,
        height: 110,
        fit: BoxFit.cover,
      ),
      */
    );
  }

  Row _headLineRow(String text1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1),
        TextButton(
            onPressed: () {},
            child: const Text(
              TextConstants.seeAll,
              style: TextStyle(color: Colors.blue),
            )),
      ],
    );
  }

  Container _popularCarsCard(Size size, index) {
    return Container(
      height: 200,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(popularCars[index].image), fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          //Arka plana hafif siyahlık verildi. Arabanın açıklaması daha net oknuyor.
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: Colors.black.withOpacity(0.3),
          ),
          child: ListTile(
            title: Text(
              popularCars[index].name,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.locationDot,
                  size: 15,
                  color: Colors.white,
                ),
                Text(
                  popularCars[index].location,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
            // Önde kullanmak için de leading: kullanılıyor. ,
            trailing:
                Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
              const Icon(Icons.star, color: Colors.orange),
              Text(
                popularCars[index].rating,
                style: const TextStyle(color: Colors.white),
              )
            ]),
          ),
        ),
      ),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Icon(FontAwesomeIcons.locationDot,
          color: Colors.black.withOpacity(0.8)),
      title: Text(
        TextConstants.appBarTitle,
        style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 15),
      ),
      centerTitle: false,
      actions: [
        _notificationItem(),
      ], //Sonda gözükmesini istediğimiz şeyler
    );
  }

  Padding _notificationItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Icon(
            FontAwesomeIcons.bell,
            color: Colors.black.withOpacity(0.8),
          ),
          Container(
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: const Text(
              '.',
            ),
          )
        ],
      ),
    );
  }
}
