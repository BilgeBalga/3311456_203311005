import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rent_car/model/recommendation_cars_model.dart';
import 'package:rent_car/constants/text_constants.dart';
import 'package:rent_car/pages/rent_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    super.key,
    this.image,
    this.name,
    this.location,
    this.rating,
    this.price,
  });
  final image;
  final name;
  final location;
  final rating;
  final price;

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image(
              image: AssetImage(
                widget.image,
              ),
              width: double.infinity,
              fit: BoxFit.cover,
              height: size.height * 0.3,
            ),
          ),
          SafeArea(
            child: Column(
              //app bar buttons
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Inkwell geri dönmeyi sağladı.
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(50),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back_sharp,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.3),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.name,
                              style: const TextStyle(
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  FontAwesomeIcons.locationDot,
                                  color: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                Text(
                                  widget.location,
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Car Details",
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              TextConstants.detailsCarDescription,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                            //Çizgi
                            const Divider(
                              height: 5,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: const <Widget>[
                                Text(
                                  "Duration: ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    "1 hour",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                const Text(
                                  "Price: ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    widget.price,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: MaterialButton(
                                color: Colors.blueGrey,
                                minWidth: double.infinity,
                                height: 55,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RentScreen(
                                          image: widget.image,
                                          name: widget.name,
                                          location: widget.location,
                                          price: widget.price,

                                          // image: ReccomendationCars[index].image,
                                        ),
                                      ));
                                },
                                child: const Text(
                                  'Rent a Car',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
