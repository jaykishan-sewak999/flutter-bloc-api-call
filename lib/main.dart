import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_block_demo/api/api_provider.dart';
import 'package:git_block_demo/api/api_repository.dart';
import 'package:git_block_demo/bloc/user_bloc.dart';
import 'package:git_block_demo/bloc/user_event.dart';
import 'package:git_block_demo/bloc/user_state.dart';

import 'model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  UserListScreen({super.key});


  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  late APIRepository repository;

  @override
  void initState() {
    final APIProvider apiProvider = APIProvider(
        baseUrl: 'https://api.github.com/users');
    repository = APIRepository(apiProvider: apiProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Git users"),),
      body: BlocProvider(create: (context) =>
      UserBloc(apiRepository: repository)
        ..add(FetchUsers()),
        child: UserListCard(),),

    );
  }
}

class UserListCard extends StatefulWidget {
  const UserListCard({super.key});

  @override
  State<UserListCard> createState() => _UserListCardState();
}

class _UserListCardState extends State<UserListCard> {
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<UserBloc, UserState>(builder: (context, state){
     if (state is UserLoading) {
       return Center(child: CircularProgressIndicator());
     }
     else if (state is UserLoaded) {
       return ListView.builder(itemBuilder: (context, index) {
         User user = state.list[index];
         return ListTile(
           title: Text(user.login),
           subtitle: Text(user.id.toString()),
         );
       },
         itemCount: state.list.length,);
     }
     else{
       return Text("Error");
     }

   });
  }
}





