import 'package:flutter/material.dart';

class DetailsOfRickMorty extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String origin;

  DetailsOfRickMorty(
      {this.imgUrl,
      this.name,
      this.status,
      this.species,
      this.gender,
      this.origin});

  @override
  _DetailsOfRickMortyState createState() => _DetailsOfRickMortyState();
}

class _DetailsOfRickMortyState extends State<DetailsOfRickMorty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        elevation: 5,
        title: Center(
          child: Text(widget.name),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
                child: Card(
                    elevation: 5,
                    margin: EdgeInsets.only(top: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        child: Image.network(widget.imgUrl)))),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              color: Colors.white60,
              elevation: 5,
              margin: EdgeInsets.only(left: 30, top: 15, right: 30),
              child: Column(
                children: [
                  ListTile(
                    title: Center(
                        child: Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          "Status   :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            child: widget.status == "Alive" ||
                                    widget.status == "Dead"
                                ? Icon(
                                    Icons.sentiment_satisfied_alt,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.sentiment_dissatisfied_outlined,
                                    color: Colors.black26,
                                  ),
                          ),
                        ),
                        Center(
                            child: widget.status == null
                                ? Text(
                                    "Unknown",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Text(
                                    widget.status,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Species :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7, right: 12),
                          child: Container(
                              child: widget.species == "Human"
                                  ? Image.asset(
                                      "assets/walk.png",
                                      height: 20,
                                      width: 20,
                                    )
                                  : Image.asset(
                                      "assets/alien.png",
                                      height: 20,
                                      width: 20,
                                    )),
                        ),
                        Center(
                            child: widget.species == null
                                ? Text(
                                    "Unknown",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Text(
                                    widget.species,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Gender  :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7, right: 12),
                          child: Container(
                              child: widget.gender == "Male"
                                  ? Image.asset(
                                      "assets/man.png",
                                      height: 20,
                                      width: 20,
                                    )
                                  : Image.asset(
                                      "assets/woman.png",
                                      height: 20,
                                      width: 20,
                                    )),
                        ),
                        Center(
                            child: widget.gender == null
                                ? Text(
                                    "Unknown",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Text(
                                    widget.gender,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              color: Colors.white60,
              elevation: 5,
              margin: EdgeInsets.only(left: 30, top: 15, right: 30),
              child: Column(

                children: [
                  ListTile(
                    title: Center(
                        child: Text(
                          "-: Origin :-",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                  ),
                  ListTile(
                    title: widget.origin == null
                        ? Expanded(
                        child: Center(
                            child: Text(
                              "Unknown",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )))
                        : Center(
                          child: Text(
                      widget.origin,
                      style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                        ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
