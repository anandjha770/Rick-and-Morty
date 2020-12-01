import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rick_and_morty/pages/details_of_rickmorty.dart';
import 'package:rick_and_morty/pages/page2.dart';
import 'package:rick_and_morty/pages/page3.dart';
import 'package:rick_and_morty/pages/page4.dart';
import 'package:rick_and_morty/pages/page5.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List rickmortyData;
  Color first = Colors.pink;
  Color second = Colors.orangeAccent;

  Future<void> getData() async {
    final String url = "https://rickandmortyapi.com/api/character";
    var response = await http.get(url);
    setState(() {
      rickmortyData = jsonDecode(response.body)["results"];
      // print(rickmortyData);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Rick & Morty")),
      ),
      drawer: Container(
        width: 250,
        child: Drawer(
          child: Container(
            // color: Colors.pink,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.yellow[800],
                Colors.yellow[700],
                Colors.yellow[600],
                Colors.yellow[400],
              ],
            )),
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                    currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset("assets/anand.jpg"),
                    ),
                    accountName: Text(
                      "Anand Jha",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    accountEmail: Text(
                      "anand******@gmail.com",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    )),
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(5))),
                  child: Column(
                    children: [
                      ListTile(title: Text("Page 1",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),trailing: Icon(Icons.double_arrow_rounded,size: 40,color: Colors.black.withOpacity(0.6),),onTap: (){Navigator.pop(context);},),
                      ListTile(title: Text("Page 2",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),trailing: Icon(Icons.double_arrow_rounded,size: 40,color: Colors.black.withOpacity(0.6),),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));},),
                      ListTile(title: Text("Page 3",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),trailing: Icon(Icons.double_arrow_rounded,size: 40,color: Colors.black.withOpacity(0.6),),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Page3()));},),
                      ListTile(title: Text("Page 4",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),trailing: Icon(Icons.double_arrow_rounded,size: 40,color: Colors.black.withOpacity(0.6),),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Page4()));},),
                      ListTile(title: Text("Page 5",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),trailing: Icon(Icons.double_arrow_rounded,size: 40,color: Colors.black.withOpacity(0.6),),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Page5(),));},),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: rickmortyData == null
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : GridView.builder(
        padding: EdgeInsets.only(bottom: 15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 0),
              itemCount: rickmortyData.length,
              itemBuilder: (context, index) => GestureDetector(
                child: Container(
                  child: Card(
                    color: Colors.white70,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 15,
                      right: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 6,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              child: Image.network(
                                rickmortyData[index]["image"],
                                fit: BoxFit.fitWidth,
                                width: 178,
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                rickmortyData[index]["name"],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsOfRickMorty(
                                imgUrl: rickmortyData[index]["image"],
                                name: rickmortyData[index]["name"],
                                status: rickmortyData[index]["status"],
                                species: rickmortyData[index]["species"],
                                gender: rickmortyData[index]["gender"],
                                origin: rickmortyData[index]["origin"]["name"],
                              )));
                },
              ),
            ),
    );
  }
}
