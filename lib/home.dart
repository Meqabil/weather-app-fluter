import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wether_api/constants.dart';
import 'package:wether_api/search_bar.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
class Home extends StatefulWidget{
  Home({super.key,required this.city});
  String city;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{

  fetchDataWeather(String city) async{
    final response = await http.get(Uri.parse(defaultApiUrl+city));
    if(response.statusCode == 200){
      weatherData = json.decode(response.body);
      print(weatherData);
      print("success");
      setState(() {

      });
    }else{
      print("Failed");
    }
  }

  @override
  void initState() {
    fetchDataWeather(widget.city);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Nabil",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: mainColor,
      ),

      body: weatherData["location"] == null ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.white,),
            SizedBox(height: 10,),
            Text("Loading...",style: TextStyle(color: Colors.white),)
          ],
      ),) : Container(
        padding: EdgeInsets.all(8),
        color: mainColor,
        child: Column(
          spacing: 25,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              decoration: BoxDecoration(
                color: Color(0x91FFE1BA),
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: ListTile(onTap: (){
                  showSearch(context: context, delegate: weatherSearch());
                },
                title: Text("Search here...",style: TextStyle(color: Colors.grey),),
                trailing: Icon(Icons.search,color: Colors.grey,),
              ),
            ),
            Expanded(child: Container()),
            ListTile(
              leading: Icon(Icons.location_on,color: Colors.white,size: 50,),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${weatherData["location"]["name"]}",style: TextStyle(color: Colors.white,fontSize: 40),),
                  Text("${weatherData["location"]["country"]}",style: TextStyle(color: Colors.white,fontSize: 15),),

                ],
              ),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${weatherData["current"]["condition"]["text"]}",style: TextStyle(color: Colors.white,fontSize: 15),),
                      Text("${weatherData["current"]["temp_c"]}",style: TextStyle(color: Colors.white,fontSize: 55),),
                    ],
                  ),
                  SizedBox(
                      width: 102,
                      height: 102,
                      child: Image.network("http:${weatherData["current"]["condition"]["icon"]}",height: 100,width: 100,fit: BoxFit.fill,color: Colors.white,))
                ],
              ),
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 15,mainAxisSpacing: 5,childAspectRatio: .75),
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFB161),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      spacing: 4,
                      children: [
                        Text("${weatherData["forecast"]["forecastday"][0]["date"]}" ,style: TextStyle(color: Colors.white,fontSize: 19),),
                        Text("${weatherData["forecast"]["forecastday"][0]["day"]["condition"]["text"]}",style: TextStyle(color: Colors.white,fontSize: 19),),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network("http:${weatherData["forecast"]["forecastday"][0]["day"]["condition"]["icon"]}",height: 50,width: 50,fit: BoxFit.fill,color: Colors.white,)
                        ),
                        Text("${weatherData["forecast"]["forecastday"][0]["day"]["maxtemp_c"]}",style: TextStyle(color: Colors.white,fontSize: 19),),
                      ],
                    )
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFB161),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                    child:Column(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("${weatherData["forecast"]["forecastday"][1]["date"]}" ,style: TextStyle(color: Colors.white,fontSize: 19),),
                        Text("${weatherData["forecast"]["forecastday"][1]["day"]["condition"]["text"]}",style: TextStyle(color: Colors.white,fontSize: 19),),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network("http:${weatherData["forecast"]["forecastday"][1]["day"]["condition"]["icon"]}",height: 50,width: 50,fit: BoxFit.fill,color: Colors.white,)
                        ),
                        Text("${weatherData["forecast"]["forecastday"][1]["day"]["maxtemp_c"]}",style: TextStyle(color: Colors.white,fontSize: 19),),
                      ],
                    )
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFB161),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                    child:Column(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("${weatherData["forecast"]["forecastday"][2]["date"]}" ,style: TextStyle(color: Colors.white,fontSize: 19),),
                        Text("${weatherData["forecast"]["forecastday"][2]["day"]["condition"]["text"]}",style: TextStyle(color: Colors.white,fontSize: 19),),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network("http:${weatherData["forecast"]["forecastday"][2]["day"]["condition"]["icon"]}",height: 50,width: 50,fit: BoxFit.fill,color: Colors.white,)
                        ),
                        Text("${weatherData["forecast"]["forecastday"][2]["day"]["maxtemp_c"]}",style: TextStyle(color: Colors.white,fontSize: 19),),
                      ],
                    )
                ),
              ],
            ),
            SizedBox(
              height: 40 ,
            )
          ],
        ),
      ),
    );
  }
}