import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc_pattern/bloc/watchlist_bloc.dart';
import 'package:watchlist_bloc_pattern/screen/categories_screen.dart';
import '../bloc/watchlist_event.dart';
import '../bloc/watchlist_state.dart';
import '../constants/constant.dart';
import '../model/model_item.dart';
import '../service/contact_resp.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ContactBloc contactBloc = ContactBloc(ContactRepository());

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: 4);
    contactBloc.add(FetchContactData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => contactBloc,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(Strings.title),
            bottom: TabBar(
              controller: _tabController,
              tabs: Strings.name,
            ),
          ),
          body:
              BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
            if (state is ContactblocLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ContactError) {
              return const Center(child: Text(Strings.error));
            }
            if (state is ContactFetchData) {
              List<ContactData> userList = state.data;
              return TabBarView(
                controller: _tabController,
                children: <Widget>[
                  CategoriesScreen(data: userList.sublist(0, 25)),
                  CategoriesScreen(data: userList.sublist(25, 50)),
                  CategoriesScreen(data: userList.sublist(50, 75)),
                  CategoriesScreen(data: userList.sublist(75)),
                ],
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
