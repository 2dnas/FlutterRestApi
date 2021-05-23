import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api_example/logic/cubits/user_data/user_data_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REST API'),
      ),
      body: BlocConsumer<UserDataCubit, UserDataState>(
        listener: (context, state) {
          if (state is UserDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserDataInitial) {
            BlocProvider.of<UserDataCubit>(context).getUserData();
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserDataLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var user = state.userList[index];
                return Dismissible(
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      print(user.id);
                      Navigator.of(context).pushNamed('/todo-screen',
                          arguments: user.id.toString());
                    },
                    title: Text(user.name!),
                    subtitle: Text(user.email!),
                  ),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (direction) => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text("Are you sure?"),
                            content:
                                Text("Are you sure you want to delete user?"),
                            actions: [
                              TextButton(
                                  onPressed: () => (Navigator.pop(context)),
                                  child: Text("NO")),
                              TextButton(onPressed: () => {
                                BlocProvider.of<UserDataCubit>(context).deleteUser(user,index),
                                Navigator.pop(context)

                              }, child: Text("YES"))
                            ],
                          )),
                );
              },
              itemCount: state.userList.length,
            );
          } else {
            return Center(
              child: Text('Ops! Something went wrong!'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed('/add-screen');
          BlocProvider.of<UserDataCubit>(context).getUserData();
        },
        child: Icon(Icons.add),

      ),
    );
  }
}
