
import 'dart:convert';
import 'dart:ffi';

import 'package:api_fetching/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future<List<Person>> fetchPersons() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

if(response.statusCode==200){
 
 List<dynamic> data=jsonDecode(response.body);
  List<Person> persons = data.map((personJson) => Person.fromJson(personJson)).toList();
  return persons;
}
else {
  throw Exception('Failed to Fetch Data');
}
}



class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
late Future<List<Person>> futurePersons;

  @override
void initState(){
super.initState();
futurePersons=fetchPersons();
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      body: Center(

          child: FutureBuilder<List<Person>>(

              future: futurePersons,
              builder: (context, snapshot) {
                if (snapshot.hasData){
                List<Person> persons= snapshot.data!;
                    return ListView.builder(
                      itemCount: persons.length,
                      itemBuilder: (context, index) {
                       Person person= persons[index];
                          return Card(
                          child:  Column(
                            children: [
                              Text(
                                                          person.id.toString(),
                                                          style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                          Text(
                                                      person.name,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),  
                                                     Text(
                                                      person.email,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ), 
                                                     Text(
                                                      person.body,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ), 
                            ],
                          ),
                                                                
                            
                          );

                      }
                      );

                } else{
                  throw Exception('Failed to fetch');
                }
                
                
              }
          
        ),
      ),
   // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
