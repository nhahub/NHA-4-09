class Quote {
  final int id;
  final String quote;
  final String author;

  const Quote({required this.id, required this.quote, required this.author});

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(id: map['id'], quote: map['quote'], author: map['author']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'quote': quote, 'author': author};
  }
}

const loadingQuote = Quote(id: 0, quote: "Loading your quote...", author: "");
