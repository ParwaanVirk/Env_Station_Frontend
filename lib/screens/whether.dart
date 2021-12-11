import 'package:flutter/material.dart';
import 'package:env_station/brain.dart';
import 'package:env_station/constants.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
class WhetherPage extends StatefulWidget {
  const WhetherPage({Key key}) : super(key: key);

  @override
  _WhetherPageState createState() => _WhetherPageState();
}

class _WhetherPageState extends State<WhetherPage> {
  Brainiac brainiac = Brainiac();

  Future<List<DataforCard>> _listFuture;
  Future<List<DataforCard>> _listFutureAll;






  @override
  void initState() {
    super.initState();
    _listFuture = brainiac.getLatestEntrydata();
    // _listFutureAll = brainiac.getAlldata();
  }



  void refreshList() {
    setState(() {
    _listFuture = brainiac.getLatestEntrydata();
    // print(_listFuture);
    // _listFutureAll = brainiac.getAlldata();
    // print(_listFutureAll);
    });
  }

  void deleteList() {
    setState(() {
    _listFuture = brainiac.getLatestEntrydata();
    // print(_listFuture);
    // _listFutureAll = brainiac.getAlldata();
    // print(_listFutureAll);
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton:  SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22),
          backgroundColor: Color(0xFF801E48),
          visible: true,
          curve: Curves.bounceIn,
          children: [
                // FAB 1
                SpeedDialChild(
                child: Icon(Icons.delete),
                backgroundColor: Color(0xFF801E48),
                
                onTap: ()async { 
                  var k = await brainiac.DeleteExcessEntries();
                  deleteList();
                 },
                label: 'Delete',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16.0),
                labelBackgroundColor: Color(0xFF801E48)),
                // FAB 2
                SpeedDialChild(
                child: Icon(Icons.refresh_sharp),
                backgroundColor: Color(0xFF801E48),
                onTap: ()async {
                  var l = await brainiac.ScrapeNewEntries();
                   refreshList();
                   
                },
                label: 'Refresh',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16.0),
                labelBackgroundColor: Color(0xFF801E48))
          ],
        ), 
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
                  // Tab(
                  //   child: Text('All Data'),
                  // ),
                  Tab(
                    child: Text('Accuweather'),
                  ),
                ]),
            preferredSize: Size.fromHeight(30.0),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: FutureBuilder(
              future: _listFuture,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.none || snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: Center(
                        child: Text("Loading. . ."),
                      ),
                    );
                  }  
                  if(snapshot.hasError && snapshot.connectionState == ConnectionState.done) 
                    return Container(child: Center(
                      child: Text('Error: ${snapshot.error}'),
                    ),);
                  if(snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                    return CardList(context, snapshot);
                  }
                  else {
                    return Container(
                      child: Center(
                        child: Text("Unknown Error. . ."),
                      ),
                    );
                  }
                },
              ),
            ),

            // Container(
            //   child: FutureBuilder(
            //   future:_listFutureAll,
            //     builder: (BuildContext context, AsyncSnapshot snapshot) {
            //       if (snapshot.connectionState == ConnectionState.none || snapshot.connectionState == ConnectionState.waiting) {
            //         return Container(
            //           child: Center(
            //             child: Text("Loading. . ."),
            //           ),
            //         );
            //       }if(snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            //         return CardList(context, snapshot);
            //       }
            //       else {
            //         return Container(
            //           child: Center(
            //             child: Text("Unknown Error. . ."),
            //           ),
            //         );
            //       }
            //     },
            //   ),
            // ),
            
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

Widget CardList(BuildContext context, AsyncSnapshot snapshot) {
  return ListView.builder(      
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: [
                              ReusableCard(cardChild: Column(
                                mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Id:  " + snapshot.data[index].id,
                                      style: kstylingforText,),
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      Text("DateTime: " + snapshot.data[index].Date_Time,
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
                              ),),
                            ],
                          ),
                        );
                         },
                    );
}
