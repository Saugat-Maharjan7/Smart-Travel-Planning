import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/FilterScreen/AApi_service.dart';
//import 'package:search_list_api_working/search.dart';
import 'package:smart_travel_planning_appli/FilterScreen/Auser_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Above5k extends StatefulWidget {

  @override
  _Above5kState createState() => _Above5kState();
}

class _Above5kState extends State<Above5k> {
  FetchAUserlist _Auserlist = FetchAUserlist();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF320D36),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Above 5K'),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       showSearch(context: context, delegate: SearchUser());
          //     },
          //     icon: Icon(Icons.search_sharp),
          //   )
          // ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: FutureBuilder<List<AUserlist>>(
              future: _Auserlist.getAuserlist(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return GestureDetector(
                          onTap: () => print('Package open'),
                          child: Card(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD8AADD),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Image.network(
                                          '${data[index].aimage}',
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${data[index].aname.toString()}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '${data[index].aduration.toString()}',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                '${data[index].aprice.toString()}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              TextButton(
                                                style: ButtonStyle(
                                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                                ),
                                                onPressed: () async {
                                                  dynamic aurls = '${data[index].aurl}';
                                                  if(await canLaunch(aurls)) {
                                                    launch(aurls);
                                                  }else {
                                                    throw 'could not launch';
                                                  }} ,
                                                child: Text('BOOK NOW'),
                                              )
                                            ])
                                    )],
                                ),
                                // trailing: Text('More Info'),
                              ),
                            ),
                          ));
                    });
              }),
        ),
      ),
    );
  }
}
