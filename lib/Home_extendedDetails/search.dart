import 'package:flutter/material.dart';

import 'Api_service.dart';
import 'user_model.dart';

class SearchUser extends SearchDelegate {
  FetchUserList _userList = FetchUserList();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
            query = '';
          },
          icon: Icon(Icons.close,
          color: Colors.tealAccent,))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back,
      color: Colors.tealAccent,),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    //Background color change so added scaffold

    return Scaffold(
      backgroundColor: Color(0xFF320D36),
      body: FutureBuilder<List<Userlist>>(
      future: _userList.getuserList(query: query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Userlist> data = snapshot.data;
        return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return ListTile(
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
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data[index].name.toString()}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 15),
                          ]),
                    )
                  ],
                ),
              );
            });
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    //Background color change so added scaffold

    return Scaffold(
      backgroundColor: Color(0xFF320D36),
      body: Center(
        child: Text('Search Packages',
        style: TextStyle(
          fontSize: 25,
          color: Colors.white
          )
        ),
      ),
    );
  }
}
