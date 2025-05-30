// ignore_for_file: camel_case_types

class veri {
  String? id;
  String? name;
  String? type; 
  String? feature1; 
  String? feature2; 
  int? location; 
  int? count;
  int? quantityInCart;

  veri({
    this.id,
    this.name,
    this.type,
    this.feature1,
    this.feature2,
    this.location,
    this.count,
    this.quantityInCart = 1,
  });

  veri copyWith({
    String? id,
    String? name,
    String? type,
    String? feature1,
    String? feature2,
    int? location,
    int? count,
    int? quantityInCart,
  }) {
    return veri(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      feature1: feature1 ?? this.feature1,
      feature2: feature2 ?? this.feature2,
      location: location ?? this.location,
      count: count ?? this.count,
      quantityInCart: quantityInCart ?? this.quantityInCart,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'feature1': feature1,
      'feature2': feature2,
      'location': location,
      'count': count,
      'quantityInCart': quantityInCart,
    };
  }

  factory veri.fromJson(Map<String, dynamic> json) {
    return veri(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      feature1: json['feature1'] as String?,
      feature2: json['feature2'] as String?,
      location: json['location'] as int?,
      count: json['count'] as int?,
      quantityInCart: json['quantityInCart'] as int? ?? 1,
    );
  }

  @override
  String toString() =>
      "Veri(id: $id, name: $name, type: $type, feature1: $feature1, feature2: $feature2, location: $location, count: $count)";

  @override
  int get hashCode =>
      Object.hash(id, name, type, feature1, feature2, location, count);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is veri &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          type == other.type &&
          feature1 == other.feature1 &&
          feature2 == other.feature2 &&
          location == other.location &&
          count == other.count &&
          quantityInCart == other.quantityInCart;
}
