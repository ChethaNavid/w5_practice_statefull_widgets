import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(children: [FavoriteCard(), FavoriteCard(), FavoriteCard()]),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  IconData get icon => isFavorite ? Icons.favorite : Icons.favorite_border;
  Color get colorIcon => isFavorite ? Colors.red : Colors.grey;

  void favorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "title",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
                Text(
                  "description",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: favorite,
            icon: Icon(icon, size: 20, color: colorIcon),
          ),
        ],
      ),
    );
  }
}
