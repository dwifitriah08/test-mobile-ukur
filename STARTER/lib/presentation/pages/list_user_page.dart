import 'package:fake_json/data/data.dart';
import 'package:fake_json/presentation/pages/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/models.dart';
import '../bloc/bloc.dart';
import 'package:intl/intl.dart';

class ListUser extends StatefulWidget {
  const ListUser({super.key});

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  final ListUserBloc _newsBloc = ListUserBloc();
  int page=0;
  int? totalPage;
  String? selectedActive;
  TextEditingController editingController = TextEditingController();
  List<Users> _Users = [];
  List<Users> _searchUsers = [];
  bool? isSearch=false;
  Users? selectedUser;
  

  @override
  void initState() {
    _newsBloc.add(GetUserList());
    super.initState();
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List User'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: (){
                showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Filter"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("Apply"),
                          ),
                        ],
                      ));
              },
              icon: const Icon(Icons.filter_list,
                color: Colors.white,
              ),),
          )
        ],
      ),
      body: _buildListUser()
    );
  }

  Widget _buildListUser() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<ListUserBloc, ListUserState>(
          listener: (context, state) {
            if (state is ListUserError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<ListUserBloc, ListUserState>(
            builder: (context, state) {
              if (state is ListUserInitial) {
                return _buildLoading();
              } else if (state is ListUserLoading) {
                return _buildLoading();
              } else if (state is ListUserLoaded) {
                
                return _buildCard(context, state.listUserModel);
              } else if (state is ListUserError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  

  
  Widget _buildCard(BuildContext context, List<UserResponse> model) {
    totalPage=model.length-1;
    if(_searchUsers.length==0){
      _searchUsers=model[page].data!.users!;
    }
    _Users=model[page].data!.users!;

    void _runFilter(String enteredKeyword) {
      List<Users> results = [];
      if (enteredKeyword.isEmpty) {
        _searchUsers=[];
        results = _Users;
      } else {
        results = _Users
            .where((user) =>
                user.profile!.name!.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
                user.company!.toLowerCase().contains(enteredKeyword.toLowerCase()) )
            .toList();
      }

      setState(() {
        _searchUsers = results;
      });
    }

    return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){
                  
                  _runFilter(value);
                },
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchUsers.length,
                itemBuilder: (context, index) {
                  var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(_searchUsers[index].registered!).toLocal();
                  String formattedDate = DateFormat("dd-MM-yyyy hh:mm").format(dateValue);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            selectedUser=_searchUsers[index];
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UserProfile(selectedUser: selectedUser)),
                            );
                          },
                          child: Card(
                            child: Container(
                              margin: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Name  : ${_searchUsers[index].profile!.name!}"),
                                  Text("Gender  : ${_searchUsers[index].profile!.gender!}"),
                                  Text("Company : ${_searchUsers[index].company}"),
                                  Text("Registered  : ${formattedDate}"),
                                  _searchUsers[index].isActive!?
                                  const Text("Active", style: TextStyle(color: Colors.green),):
                                  const Text("Not Active",style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      index==model[page].data!.users!.length-1?
                      Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: page!=0? (){
                                setState(() {
                                  page--;
                                  _searchUsers=model[page].data!.users!;
                                });
                              }:null,
                              icon: Icon(Icons.arrow_back_ios,
                                color: page!=0? Colors.grey:Colors.white,
                              ),),
                          ),
                          Expanded(
                            child: Center(child: Text("Page ${model[page].data!.current!+1}"))
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: page!=totalPage? (){
                                setState(() {
                                  page++;
                                  _searchUsers=model[page].data!.users!;
                                });
                              }:null,
                              icon: Icon(Icons.arrow_forward_ios,
                                color: page!=totalPage? Colors.grey:Colors.white,
                              ),),
                          )
                        ],
                      ):Container(),
                    ],
                  );
                },
              ),
            ),
            
          ],
        ),
      );
    
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

}