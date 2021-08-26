import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ksc_prekin_lt_matsuri/models/likes.dart';
import 'package:ksc_prekin_lt_matsuri/screens/likes.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('投票 Sample'),
        actions: <Widget>[
          TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, LikesPage.routeName);
            },
            icon: const Icon(Icons.favorite_border),
            label: const Text('Likes'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        cacheExtent: 20.0,
        controller: ScrollController(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(
    this.itemNo,
  );

  @override
  Widget build(BuildContext context) {
    var likesList = Provider.of<Likes>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: likesList.items.contains(itemNo)
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            !likesList.items.contains(itemNo)
                ? likesList.add(itemNo)
                : likesList.remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(likesList.items.contains(itemNo)
                    ? 'Added to likes.'
                    : 'Removed from likes.'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
