import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/watchlist_bloc.dart';
import '../model/model_item.dart';
import '../service/contact_resp.dart';
import '../widget/list_item.dart';

class CategoriesScreen extends StatefulWidget {
  List<ContactData> data;
  CategoriesScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState(data);
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late ContactBloc watchlistBloc = ContactBloc(ContactRepository());
  List<ContactData> data;
  _CategoriesScreenState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: listItem(context, data),
        ),
      ),
    );
  }
}

