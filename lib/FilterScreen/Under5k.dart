import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/FilterScreen/UApi_service.dart';
//import 'package:search_list_api_working/search.dart';
import 'package:smart_travel_planning_appli/FilterScreen/Uuser_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Under5k extends StatefulWidget {

  @override
  _Under5kState createState() => _Under5kState();
}

class _Under5kState extends State<Under5k> {
  FetchUUserlist _Uuserlist = FetchUUserlist();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF320D36),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Packages'),
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
          child: FutureBuilder<List<UUserlist>>(
              future: _Uuserlist.getUuserlist(),
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
                                          '${data[index].uimage}',
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
                                                '${data[index].uname.toString()}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '${data[index].uduration.toString()}',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                '${data[index].uprice.toString()}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                                                ),
                                                onPressed: () async {
                                                  dynamic uurls = '${data[index].uurl}';
                                                  if(await canLaunch(uurls)) {
                                                    launch(uurls);
                                                  }else {
                                                    throw 'could not launch';
                                                  }} ,
                                                child: Text('BOOK NOW',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),),
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

