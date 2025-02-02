class Prediction {
  final String placeId;
  final String description;
  final StructuredFormatting? structuredFormatting;

  Prediction({
    required this.placeId,
    required this.description,
    this.structuredFormatting,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      placeId: json['place_id'] as String,
      description: json['description'] as String,
      structuredFormatting: json['structured_formatting'] != null
          ? StructuredFormatting.fromJson(json['structured_formatting'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'place_id': placeId,
      'description': description,
      'structured_formatting': structuredFormatting?.toJson(),
    };
  }

  @override
  String toString() {
    return 'Prediction${toJson()}';
  }
}

class StructuredFormatting {
  final String? mainText;
  final String? secondaryText;

  StructuredFormatting({
    this.mainText,
    this.secondaryText,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'] as String?,
      secondaryText: json['secondary_text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'main_text': mainText,
      'secondary_text': secondaryText,
    };
  }

  @override
  String toString() {
    return 'StructuredFormatting${toJson()}';
  }
}
