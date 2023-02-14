import 'package:flutter/material.dart';
import 'package:watchlist_bloc_pattern/model/model_item.dart';

Widget listItem(BuildContext context, List<ContactData> userList) {
  return Container(
      padding: const EdgeInsets.only(top: 15),
  height: MediaQuery.of(context).size.height,
  width: double.infinity,
    child:ListView.builder(
        itemCount: userList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 4, horizontal: 8),
            child: Card(
              elevation: 2,
              // color: Theme.of(context).primaryColor,
              child: ListTile(
                  title: Text(
                    '${userList[index].name} ',
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    '${userList[index].Contacts}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://googleflutter.com/sample_image.jpg",
                      ))
              ),
            ),
          );
        }),
  );
  }