import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rest_api_example/data/models/user.dart';
import 'package:flutter_rest_api_example/data/repositories/user_repository.dart';

class AddNewUserScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController website = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        controller: id,
                        decoration:
                            InputDecoration(hintText: "Please enter id"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid ID";
                          }
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        controller: name,
                        decoration:
                            InputDecoration(hintText: "Please enter name"),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid name";
                          }
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        controller: username,
                        decoration:
                            InputDecoration(hintText: "Please enter username"),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid username";
                          }
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        controller: email,
                        decoration:
                            InputDecoration(hintText: "Please enter Email"),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid Email";
                          }
                        },
                      ),
                    ),
                  ),

                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        controller: phone,
                        decoration:
                            InputDecoration(hintText: "Please enter phone"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid phone";
                          }
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        controller: website,
                        decoration:
                            InputDecoration(hintText: "Please enter website"),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid website";
                          }
                        },
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            User user = User(
                              id : int.parse(id.text),
                              name: name.text,
                              username: username.text,
                              email: email.text,
                              website: website.text,
                            );
                            UserRepository().addUser(user);
                            Navigator.pop(context);
                        }
                        },
                        child: Text("Add User"),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
