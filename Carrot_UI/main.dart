import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: const [
            Icon(Icons.search, color: Colors.black,),
            SizedBox(width: 20,),
            Icon(Icons.menu_outlined,color: Colors.black),
            SizedBox(width: 20,),
            Icon(Icons.notifications,color: Colors.black),
            SizedBox(width: 20,),
          ],
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("금호동3가", style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/pepe.png",scale:7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10,5,0,0),
                    child: const Text("캐논 DLSR 100D (단렌즈,\n충전기 16기가SD 포함)", style: TextStyle(
                        fontWeight: FontWeight.w500,
                      fontSize: 18
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("성당구 행당동 끌올 10분 전",style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ), ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("210,000원", style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),),
                  ),
                  Container(
                    //decoration: BoxDecoration(color: Colors.yellow,),
                    width: 250,
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(Icons.heart_broken_outlined),
                        Text("4"),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      )
    );
  }
}
