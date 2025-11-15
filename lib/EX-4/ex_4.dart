import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            ScoreCard(title: "Flutter"),
            SizedBox(height: 20),
            ScoreCard(title: "Dart"),
            SizedBox(height: 20),
            ScoreCard(title: "React"),
          ],
        ),
      ),
    ),
  ),
);

class ScoreCard extends StatefulWidget {
  final String title;
  final int maxScore;

  const ScoreCard({super.key, required this.title, this.maxScore = 10});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 0;

  void addScore() {
    setState(() {
      score += 1;
    });
  }

  void minusScore() {
    setState(() {
      score -= 1;
    });
  }

  Color get scoreColor {
    if (score > 0 && score < 5) return Colors.green[300]!;
    if (score >= 5 && score <= 7) return Colors.green[600]!;
    return Colors.green[900]!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            "My score in ${widget.title}",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[500],
            ),
          ),

          SizedBox(height: 5),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: minusScore,
                icon: const Icon(Icons.remove, size: 20),
              ),
              IconButton(
                onPressed: addScore,
                icon: const Icon(Icons.add, size: 20),
              ),
            ],
          ),

          SizedBox(height: 15),

          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: ClipRRect( // Prevent child from overflow the container radius
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: score / 10,
                backgroundColor: Colors.white,
                color: scoreColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
