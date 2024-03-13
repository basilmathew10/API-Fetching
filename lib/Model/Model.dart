class Person{
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;


  Person({

    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,

  });

  factory Person.fromJson(Map<String,dynamic>json){

    return Person(
      postId:json['postId'],
      id:json['id'],
      name:json['name'],
      email:json['email'],
      body:json['body']


    );
  }


}