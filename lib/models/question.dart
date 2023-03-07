class Question {
  final String title;
  final String content;
  final List<String> tags;
  final String author;
  final int likes;
  final int answers;

  Question(
      {required this.title,
      required this.content,
      required this.tags,
      required this.author,
      required this.likes,
      required this.answers});
}

List<Question> questions = [
  Question(
    title: "Câu hỏi 1",
    content: "Nội dung câu hỏi 1",
    tags: ["Môn học A", "Chủ đề X"],
    author: "Người đăng 1",
    likes: 10,
    answers: 5,
  ),
  Question(
    title: "Câu hỏi 2",
    content: "Nội dung câu hỏi 2",
    tags: ["Môn học B", "Chủ đề Y"],
    author: "Người đăng 2",
    likes: 20,
    answers: 3,
  ),
  Question(
    title: "Câu hỏi 3",
    content: "Nội dung câu hỏi 3",
    tags: ["Môn học A", "Chủ đề Z"],
    author: "Người đăng 3",
    likes: 5,
    answers: 8,
  ),
  //Thêm các câu hỏi khác vào đây
];
