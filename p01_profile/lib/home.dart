import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text("K hola")),
        backgroundColor: Colors.white,
        body: SafeArea( 
          child: Center(
              child: Container(
                  alignment: Alignment.center,

                  // width: 350.0,
                  // height: 800.0,
                  margin: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(113, 0, 0, 0),
                      width: 3.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: const Color.fromRGBO(217, 217, 217, 1),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // Container(
                        //   margin: const EdgeInsets.all(2),
                        //   child: Stack(children: [
                        //     Positioned(
                        //       top: 20.0,
                        //       left: 45.0,
                        //       child: Container(
                        //           decoration: BoxDecoration(
                        //               border: Border.all(
                        //                   width: 3, color: Colors.black)),
                        //           child: const Icon(Icons.multiple_stop)),
                        //     )
                        //   ]),
                        // ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset('assets/images/backimg.png')),

                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/pp.jpg'),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                color: Colors.blue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        const Text(
                          'Kavi Singh',
                          style: TextStyle(
                              color: Color.fromARGB(255, 77, 73, 73),
                              fontSize: 24,
                              fontFamily: 'Prabin_Le_Sikako'),
                        ),
                        const Text(
                            'Hello World, This is not just a simple world!',
                            style: TextStyle(
                                color: Color.fromARGB(255, 76, 72, 71),
                                fontSize: 14)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                width: 130,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(
                                          255, 25, 85, 134),
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Padding(padding: EdgeInsets.all(5)),
                                    Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Follow",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )),
                            Container(
                                margin: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                width: 130,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(
                                          255, 25, 85, 134),
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Padding(padding: EdgeInsets.all(5)),
                                    Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Message",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(118, 0, 0, 0),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(22)),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child:
                                      Image.asset('assets/images/gaida.png')),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const <Widget>[
                                    Icon(Icons.link_rounded, size: 40),
                                    Icon(Icons.share, size: 35),
                                    Icon(Icons.download, size: 35),
                                    Icon(Icons.comment_bank_outlined, size: 35),
                                  ])
                            ],
                          ),
                        ),
                      ]))),
        ));
  }
}
