class ForumItem {
  final String question;
  final String description;
  final String image;

  const ForumItem({
    required this.question,
    required this.description,
    required this.image,
  });
}

const List<ForumItem> items = [
  ForumItem(
    question: "Flower is not grown properly",
    description: "description",
    image:
        "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=998&q=80",
  )
];
