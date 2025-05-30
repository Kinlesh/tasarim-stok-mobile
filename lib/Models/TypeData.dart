class TypeData {
  String? name;

  TypeData({
    this.name,
  });

  TypeData copyWith({
    String? name,
  }) {
    return TypeData(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  factory TypeData.fromJson(Map<String, dynamic> json) {
    return TypeData(
      name: json['name'] as String?,
    );
  }

  @override
  String toString() => "TypeData(name: $name)";

@override
int get hashCode => name.hashCode;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeData &&
          runtimeType == other.runtimeType &&
          name == other.name;
}
