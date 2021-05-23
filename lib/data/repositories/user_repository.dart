import 'package:dio/dio.dart';
import 'package:flutter_rest_api_example/data/models/user.dart';

class UserRepository {
  List<User>? userList = [];
  Dio dio = Dio();

  Future<List<User>>? fetchUsers() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      var loadedUsers = <User>[];
      response.data.forEach((user) {
        var userModel = User.fromJson(user);
        loadedUsers.add(userModel);
        userList = loadedUsers;
        return userList!;
      });
    }
    return userList!;
  }

  //აქ dio.delete ში ჩაჯდება იუზერების წაშლის სერვისის Url
  Future<List<User>>? deleteUser(User user, int index) async {
    //იუზერების url ს წაშლის სერვისი არ გააჩნია
    final  response = await dio.delete('https://jsonplaceholder.typicode.com/users/${user.id}');
    if(response.statusCode == 200){
      //აქ თავიდან ამოვიღებდით სერვისიდან ლისტს და დავაბრუნებდით იმას მაგრამ
      //რადგან ესეთი სერვისი არ აქვს პირდაპირ ხელით წავშლი და დავაბრუნებ იმას
    }
    userList!.removeAt(index);
    return userList!;
  }

  Future<List<User>>? addUser(User user) async {
    final response = await dio.post(
      'https://jsonplaceholder.typicode.com/users',
      data : {user.id, user.name,user.username,user.email,user.website});
    if(response.statusCode == 200){
      //იგივე რაც წაშლაზე იყო url ს არაქვს დამატების სერვისი ამიტომ ხელით ვიზამ
    }
    userList!.add(user);
    return userList!;
  }
  

}