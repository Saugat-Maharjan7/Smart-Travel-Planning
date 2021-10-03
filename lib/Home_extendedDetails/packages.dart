import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/Home_extendedDetails/Api_service.dart';
import 'package:smart_travel_planning_appli/Home_extendedDetails/search.dart';
import 'package:smart_travel_planning_appli/Home_extendedDetails/user_model.dart';
import 'package:smart_travel_planning_appli/FilterScreen/FilterScreen.dart';
import 'package:url_launcher/url_launcher.dart';


class PackageScreen extends StatefulWidget {


  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {


  FetchUserList _userList = FetchUserList();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Colors.white,

          onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FilterScreen()));
            // Add your onPressed code here!
          },
          label:  Text('Filter'),
          icon:  Icon(Icons.filter_list_alt),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Color(0xFF320D36),
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          title: Text('Packages'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        body: Container(

          padding: EdgeInsets.all(10),
          child: FutureBuilder<List<Userlist>>(
              future: _userList.getuserList(),
              builder: (context, snapshot) {

                var data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }


                      // void _launchURL() async =>
                      //     await canLaunch('${data[index].url}') ? await launch('${data[index].url}') : throw 'Could not launch ';
                      // openURL() async {
                      //   if(await canLaunch("${data[index].url}")) {
                      //      await launch("${data[index].url}");
                      //   }else{throw 'could not launch';
                      //   }
                      //  }
                      return GestureDetector(
                        onTap: () => print('Package open'),
                        child: Card(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
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
                                        '${data[index].image}',
                                        fit: BoxFit.cover,
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
                                            '${data[index].name.toString()}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                            maxLines: 2,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            '${data[index].duration.toString()}',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            '${data[index].price.toString()}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),

                                          ElevatedButton(
                                            style: ButtonStyle(
                                            ),
                                            onPressed: () async {
                                              dynamic urls = '${data[index].url}';
                                              if(await canLaunch(urls)) {
                                                launch(urls);
                                              }else {
                                                throw 'could not launch';
                                              }} ,
                                            child: Text('BOOK NOW'),
                                          )

                                        ]),

                                  )

                                ],
                              ),
                              // trailing: Text('More Info'),
                            ),
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
