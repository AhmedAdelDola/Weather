import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/const.dart';
import 'methods/fetch data.dart';
import 'methods/position.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => homeState();
}


class homeState extends State<home> {
  @override
  void initState() {
    getdata();
    getPosition();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home:
      Scaffold(
      body:FutureBuilder(
        future: getdata(),
        builder:  (context, snapshot) {
          if(snapshot.hasData){
            return Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      width: double.infinity,
                      height: 600,
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                      //margin: EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        image:DecorationImage(image:AssetImage("images/1.jpg"),fit: BoxFit.fill),
                          //color: Colors.blue,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100))
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("The Weather",style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image.asset("images/22.png",
                            height: 150
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.white70,
                            borderRadius: BorderRadius.circular(50),
                            ),
                            child: Column(
                              children: [
                                Text("temprature",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                                Image.asset("images/5.png",
                                height: 100),
                                Text("${weatherclass.currentWeather?.temperature}°C",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: Colors.white70,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    children: [
                                      Text("windspeed",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      Image.asset("images/3.png",
                                          height: 50),
                                      Text("${weatherclass.currentWeather?.windspeed} Km/h",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: Colors.white70,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    children: [
                                      Text("time",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      Image.asset("images/4.png",
                                          height: 50),
                                      Text("${DateTime.parse('${weatherclass.currentWeather?.time}').format('h:i a')} ",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],

                          )
                        ],
                      ),

                    ),
                  ),

                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      getdata();
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(5),
                      width: 180,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                      color: Colors.blue,

                      ),
                      child: Row(
                        children: [
                          Icon(Icons.restart_alt,color: Colors.white,size: 35),
                          Text('Restart',style: TextStyle(color: Colors.white,fontSize: 35),)
                        ],
                      ),

                    ) ,
                  ),
                )
                ],


              ),

            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),

      ),
    );
  }
}
