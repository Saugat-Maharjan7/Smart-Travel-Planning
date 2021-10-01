import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/models/destination_model.dart';
import 'package:smart_travel_planning_appli/models/package_place.dart';

class PackageContainer extends StatelessWidget {
  final Package package;
  final int index;
  const PackageContainer({this.package, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:170,
      margin: EdgeInsets.only(left: 30, top: 25),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(package.imageUrl),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))
                  ),
                ),
                (index == 0)? Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 54,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)
                        )
                    ),
                    child: Center(
                      child: Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                      ),
                    ),
                  ),
                ): SizedBox(),
              ],
            ),
            Container(
              height: 40,
              width: 120,
              decoration:  BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Center(
                child: Text(package.package,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
