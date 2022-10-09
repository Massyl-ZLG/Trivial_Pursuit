
class User {
  late String id ;
  late final String lastname ;
  late final String firstname ;
  late final int age ;
  late final String  nickname ;
  late final String  email ;

  User({
    this.id = '',
    required this.lastname ,
    required this.firstname ,
    this.age = 0 ,
    required this.nickname ,
    required this.email ,
  });



  Map<String , dynamic> toJson() => {
      'id' : id,
      'lastname' :lastname ,
      'age' : age,
      'firstname' : firstname ,
      'nickname': nickname ,
      'email'  : email,
  };
  
  static User fromJson(Map<String , dynamic> json) => User(
      id :   json['id'],
      lastname: json['lastname'],
      firstname: json['firstname'],
      nickname: json['nickname'],
      email: json['email']
  );

}

