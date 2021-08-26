import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ksc_prekin_lt_matsuri/models/likes.dart';

class LikesPage extends StatelessWidget {
  static String routeName = '/likes_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likes'),
      ),
      body: Consumer<Likes>(
        builder: (context, value, child) => value.items.isNotEmpty
            ? ListView.builder(
                itemCount: value.items.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) =>
                    LikeItemTile(value.items[index]),
              )
            : const Center(
                child: Text('No favorites added.'),
              ),
      ),
    );
  }
}

class LikeItemTile extends StatelessWidget {
  final int itemNo;

  const LikeItemTile(
    this.itemNo,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('likes_text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$itemNo'),
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<Likes>(context, listen: false).remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed from likes.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
