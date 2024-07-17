import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final dynamic userData;
  final Function onTap;
  const ListItem(this.userData, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(userData.id);
      },
      leading: CircleAvatar(
        backgroundImage:
            NetworkImage(userData.avatar ?? 'https://via.placeholder.com/150'),
      ),
      title: Text('${userData.firstName ?? ''} ${userData.lastName ?? ''}',
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      subtitle:
          Text(userData.email ?? '', style: const TextStyle(fontSize: 18.0)),
      trailing: Text('Id No: ${userData.id?.toString()}' ?? '',
          style: const TextStyle(fontSize: 16.0)),
    );
  }
}
