import 'package:flutter/material.dart';
import 'package:wether_api/constants.dart';

class NoCity extends StatelessWidget {
  final String city;

  const NoCity({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("No City",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orange,
      ),
      body: city == null ? Center(child: CircularProgressIndicator(color: Colors.white,)) : Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "There is no city named : ",
                    style: TextStyle(fontSize: 20,color: Colors.grey.shade300),
                  ),
                  Text(
                    city,
                    style: TextStyle(fontSize: 28,color: Colors.white,fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}