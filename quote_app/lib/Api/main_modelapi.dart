//Model for first page
class MainModelapi {
    MainModelapi({
        required this.quote,
        required this.author,
    });

    final String? quote;
    final String? author;

    MainModelapi copyWith({
        String? quote,
        String? author,
    }) {
        return MainModelapi(
            quote: quote ?? this.quote,
            author: author ?? this.author,
        );
    }

    factory MainModelapi.fromJson(Map<String, dynamic> json){ 
        return MainModelapi(
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


//Model for acting page


//Model for art page


//Model for business page


//Model for music page


//Model for poetry page


//Model for Politics page


//Model for Religion page


//Model for life page


//Model for Technology page


//Model for Inspirational page

