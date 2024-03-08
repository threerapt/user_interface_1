import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_interface_1/screen/Scanscreen.dart';

class Dashboard extends StatelessWidget {
  var height, width;

  List imgData = [
    "images/ui.jpg",
    "images/barcode.jpg",
    "images/list.png",
    "images/total.png",
    
  ];

  List titles = [
    "MainPage",
    "Scan Barcode",
    "List",
    "Report",
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.indigo,
           height: height ,
           width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(),
                height: height * 0.25 ,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 35,
                      left: 20,
                      right: 20, 
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(Icons.sort,
                        color: Colors.white,
                        size: 40,
                        ),
                      ),
                      Container(
                         height: 50,
                         width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                              "images/man.png" ,
                              ))),
             
                      ),
                    ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DASHBOARD",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                          ),
                          SizedBox(height: 10),
                          Text(
                          "Last Update: ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white54,
                            letterSpacing: 1,
                          ),
                          )
                      ],
                    ),
                  ),
                ],
                ) ,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                height: height * 0.75 ,
                width: width,
                padding: EdgeInsets.symmetric(vertical: 50),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 25,
                  ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: imgData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MyApp(),
                        ));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(imgData[index],
                          width: 100,
                          ),
                          Text(
                            titles[index],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),                                                                                                        
                          ),
                        ],
                      ),
                    ),
                  );
                },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}