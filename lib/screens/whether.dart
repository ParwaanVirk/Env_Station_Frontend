import 'package:flutter/material.dart';
import 'package:env_station/brain.dart';
import 'package:env_station/constants.dart';
class WhetherPage extends StatefulWidget {
  const WhetherPage({Key key}) : super(key: key);

  @override
  _WhetherPageState createState() => _WhetherPageState();
}

class _WhetherPageState extends State<WhetherPage> {
  Brainiac brainiac = Brainiac();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Env App',
            style: TextStyle(fontSize: 16.0),
          ),
          bottom: PreferredSize(
            // tabBar== Displaying the names of the News Sources/
            child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text('Latest '),
                  ),
                  Tab(
                    child: Text('All Data'),
                  ),
                  Tab(
                    child: Text('Data 3'),
                  ),
                ]),
            preferredSize: Size.fromHeight(30.0),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: FutureBuilder(
              future: brainiac.getLatestEntrydata(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text("Loading. . ."),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Expanded(child: ReusableCard(cardChild: Column(
                            mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Id: " + snapshot.data[index].id,
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("SensorTiltX: " +  (snapshot.data[index].SensorTiltX).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("SensorTiltY: " + (snapshot.data[index].SensorTiltY).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("SensorTiltZ: " + (snapshot.data[index].SensorTiltZ).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("SensorAlert: " + snapshot.data[index].SensorAlert,
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("PM01: " + (snapshot.data[index].PM01).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("PM2.5: " + (snapshot.data[index].PM25).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("PM10: " + (snapshot.data[index].PM10).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("Temprature: " + (snapshot.data[index].Temprature).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("Humidity: " + (snapshot.data[index].Humidity).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("SoilMoisture: " + (snapshot.data[index].SoilMoisture).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                 

                                ]
                          ),),),
                        );
                         },
                    );
                  }
                },
              ),
            ),

            Container(
              child: FutureBuilder(
              future: brainiac.getAlldata(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text("Loading. . ."),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Expanded(child: ReusableCard(cardChild: Column(
                            mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Id: " + snapshot.data[index].id,
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("SensorTiltX: " +  (snapshot.data[index].SensorTiltX).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("SensorTiltY: " + (snapshot.data[index].SensorTiltY).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("SensorTiltZ: " + (snapshot.data[index].SensorTiltZ).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("SensorAlert: " + snapshot.data[index].SensorAlert,
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("PM01: " + (snapshot.data[index].PM01).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("PM2.5: " + (snapshot.data[index].PM25).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("PM10: " + (snapshot.data[index].PM10).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("Temprature: " + (snapshot.data[index].Temprature).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("Humidity: " + (snapshot.data[index].Humidity).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text("SoilMoisture: " + (snapshot.data[index].SoilMoisture).toString(),
                                  style: kstylingforText,),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                 

                                ]
                          ),),),
                        );
                         },
                    );
                  }
                },
              ),
            ),
            
            Container(
               child: Center(
                        child: Text("Backend Incomplete"),
                      ),
                    
              // child: FutureBuilder(
              // // future: brainiac.getdata('abc-news'),
              //   builder: (BuildContext context, AsyncSnapshot snapshot) {
              //     if (snapshot.data == null) {
              //       return Container(
              //         child: Center(
              //           child: Text("Loading. . ."),
              //         ),
              //       );
              //     } else {
              //       return ListView.builder(
              //         itemCount: snapshot.data.length,
              //         itemBuilder: (BuildContext context, int index) {
              //            },
              //       );
              //     }
              //   },
              // )
            ),
          ]
        ),
      ),
    );
  }
}




class ReusableCard extends StatelessWidget {
  const ReusableCard({ Key key, 
  @required this.cardChild, 
  }) : super(key: key);

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
      ),

    );
  }
}