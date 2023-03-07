import 'package:flutter/material.dart';

class QuestionDetailScreen extends StatefulWidget {
  @override
  _QuestionDetailScreenState createState() => _QuestionDetailScreenState();
}

class _QuestionDetailScreenState extends State<QuestionDetailScreen> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is a derivative?",
      "answer":
          "A derivative is a measure of how a function changes as its input changes.",
      "explanation":
          "In calculus, the derivative of a function represents the slope of the function's graph at a particular point. It is used to solve many problems in physics, engineering, and economics.",
    },
    {
      "question": "What is a limit?",
      "answer":
          "A limit is the value that a function approaches as its input approaches a certain value.",
      "explanation":
          "In calculus, limits are used to define important concepts such as continuity, derivatives, and integrals. They are also used to study the behavior of functions near singular points.",
    },
    {
      "question": "What is a matrix?",
      "answer":
          "A matrix is a rectangular array of numbers, symbols, or expressions.",
      "explanation":
          "Matrices are used in many areas of mathematics, science, and engineering to represent systems of linear equations, transformations, and data. They can be added, subtracted, multiplied, and inverted, among other operations.",
    },
  ];

  List<Map<String, dynamic>> favoriteQuestions = [];
  List<Map<String, dynamic>> purchasedQuestions = [];
  void addToFavorites(int index) {
    setState(() {
      if (favoriteQuestions.contains(questions[index])) {
        favoriteQuestions.remove(questions[index]);
      } else {
        favoriteQuestions.add(questions[index]);
      }
    });
  }

  void addToPurchased(int index) {
    setState(() {
      purchasedQuestions.add(questions[index]);
    });
  }

  bool isFavorite(int index) {
    return favoriteQuestions.contains(questions[index]);
  }

  // bool isFavorite = false;

  // void addToFavorites(int index) {
  //   setState(() {
  //     isFavorite = !isFavorite;
  //   });
  // }

  // void addToPurchased(int index) {
  //   setState(() {
  //     purchasedQuestions.add(questions[index]);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 103, 119),
        title: Text("Question Detail"),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 68, 103, 119),
              Color.fromARGB(255, 144, 191, 230),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Sắp xếp các Widget giữa hai cạnh trái và phải
                  children: [
                    Expanded(
                      child: Text(
                        questions[index]['question'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => addToFavorites(index),
                      icon: Icon(
                        isFavorite(index)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavorite(index) ? Colors.red : Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                SizedBox(height: 8.0),
                Text(
                  'Answer: ${questions[index]['answer']}',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Explanation: ${questions[index]['explanation']}',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () => addToPurchased(index),
                    //   child: Text('Unclock Question'),
                    //   style: ElevatedButton.styleFrom(
                    //     primary: Colors.amber[800],
                    //   ),
                    // ),
                    ElevatedButton.icon(
                      onPressed: () => addToPurchased(index),
                      icon: Icon(Icons.lock), // Thêm icon ổ khóa
                      label: Text('Unclock Question'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 243, 72, 29),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Divider(color: Colors.grey[300], thickness: 1.0, height: 30.0),
              ],
            );
          },
        ),
      ),
    );
  }
}
