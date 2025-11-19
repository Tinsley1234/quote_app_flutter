class QuoteApi {
    QuoteApi({
        required this.quote,
        required this.author,
    });

    final String? quote;
    final String? author;

    QuoteApi copyWith({
        String? quote,
        String? author,
    }) {
        return QuoteApi(
            quote: quote ?? this.quote,
            author: author ?? this.author,
        );
    }

    factory QuoteApi.fromJson(Map<String, dynamic> json){ 
        return QuoteApi(
            quote: json["quote"],
            author: json["author"],
        );
    }

    Map<String, dynamic> toJson() => {
        "quote": quote,
        "author": author,
    };

    @override
    String toString(){
        return "$quote, $author, ";
    }
}
