import 'package:flutter/material.dart';

import 'buttons_row.dart';

Color twoDGrey = Color.fromRGBO(238, 238, 238, 1);

class ExampleHeartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey, primaryColor: Colors.white),
      home: Page(),
    );
  }
}

class Page extends StatelessWidget {
  static const double cardWidth = 175;
  static const double cardHeight = 250;
  static const double titleWidth = 160;
  static const double titleHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60, left: 30),
              color: const Color.fromRGBO(245, 245, 245, 1),
              padding: const EdgeInsets.only(top: 18.0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Expanded(
                        child: Column(
                          children: [
                            PageTitle(
                                titleWidth: titleWidth,
                                titleHeight: titleHeight),
                            PageAbout()
                          ],
                        ),
                      )
                    ]))
              ]),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                width: cardWidth,
                height: cardHeight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/img_copertina.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(7.5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          offset: const Offset(5, 5),
                          blurRadius: 20)
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key key,
    @required this.titleWidth,
    @required this.titleHeight,
  }) : super(key: key);

  final double titleWidth;
  final double titleHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: titleWidth),
        width: titleWidth,
        height: titleHeight,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "This Must Be\nthe Place",
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 18, bottom: 36),
            child: Text(
              "By Paolo Sorrentino",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 12.0,
                  color: Colors.black45),
            ),
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              "1042 ",
              style: TextStyle(
                color: const Color.fromARGB(255, 2, 101, 252),
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat",
                fontSize: 12.0,
              ),
            ),
            Text("Views",
                style: TextStyle(
                  color: Colors.black45,
                  fontFamily: "Montserrat",
                  fontSize: 12.0,
                )),
            Container(
                margin: const EdgeInsets.only(left: 18),
                child: Icon(Icons.arrow_forward_ios,
                    size: 12, color: Colors.black45))
          ])
        ]));
  }
}

class PageAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
          ButtonsRow(),
          Container(
              height: 0.75,
              color: const Color.fromRGBO(151, 151, 151, 0.29),
              margin: const EdgeInsets.symmetric(horizontal: 18.0)),
          Container(
              margin: const EdgeInsets.all(18.0),
              child: Text("About",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      fontFamily: "Montserrat"))),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SingleChildScrollView(
                    child: Text(
                        """Cheyenne is a wealthy former rock star, now bored and jaded in his 20-year retirement in Dublin. He retired after two of his teenaged fans committed suicide. He travels to New York to reconcile with his estranged father during his final hours, only to arrive too late. The reason he gives for not communicating with his father for 30 years was that his father rejected him when he put on goth make-up at the age of 15. He reads his father's diary and learns about his father's persecution in Auschwitz at the hands of former SS officer Alois Lange. He visits a professional Nazi hunter named Mordecai Midler who tells him that Lange is small fry.
Cheyenne begins a journey across the United States to track down Lange. Cheyenne finds the wife of Lange, Lange's granddaughter and a businessman. He buys a large gun. At the gun shop, a bystander delivers a soliloquy about a certain type of pistol that allows people to "kill with impunity," and given that ability, "if we’re licensed to be monsters we end up having just one desire – to truly be monsters."
When Cheyenne eventually tracks Lange down with the aid of Mordecai, Lange, now blind, says that he received hate mail from Cheyenne's father for decades. Lange recounts the incident that led to Cheyenne's father's obsession with Lange, in which Cheyenne's father peed his pants from fear; Lange describes this as a "minor incident" in comparison to the true horrors of Auschwitz, but mentions that he came to admire the man's single-minded determination to dedicate his life to making his own miserable. Cheyenne takes a photo of Lange and whispers that it was an injustice for his father to die before Lange did. Cheyenne forces the old blind man to walk out into the salt flats naked, like a Holocaust victim; skin and bones and numb with fear. Cheyenne and Mordecai drive away soon afterwards, leaving him still standing in the flats.
Cheyenne travels home via airplane (something he had previously had a strong phobia of), cuts his rockstar hair and stops wearing his goth make-up, jewelry and outfits.""",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14.0,
                            fontFamily: "Montserrat",
                            height: 1.4))),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                margin: const EdgeInsets.only(top: 18),
                child: RaisedButton(
                    onPressed: () => {},
                    elevation: 0,
                    child: Text("Read Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 18),
                    color: const Color.fromARGB(255, 2, 101, 252)))
          ])
        ]));
  }
}
