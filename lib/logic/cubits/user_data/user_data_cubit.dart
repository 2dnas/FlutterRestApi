import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_example/data/models/user.dart';
import 'package:flutter_rest_api_example/data/repositories/user_repository.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  final userRepo = UserRepository();

  Future<void> getUserData() async {
    try {
      var list = await userRepo.fetchUsers();
      emit(UserDataLoaded(userList: list!));
    } catch (e) {
      emit(UserDataError(message: e.toString()));
    }
  }

  Future<void> deleteUser(User user,int index) async {
    try {
      var list = await userRepo.deleteUser(user,index);
      emit(UserDataLoaded(userList: list!));
    }catch (e) {
      emit(UserDataError(message: e.toString()));
    }
  }

  Future<void> addUser(User user) async {
    try{
      var list = await userRepo.addUser(user);
      emit(UserDataLoaded(userList: list!));
    }catch (e) {
      emit(UserDataError(message: e.toString()));
    }
  }
}
