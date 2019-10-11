class Group {
  final int id;
  final String name;
  final String description;

  Group({ this.id, this.name, this.description });
 

  Group.fromMap(Map<String, dynamic> map)
      : id = int.parse(  map['id'] ),
        name = map['name'],
        description = map['description'];
}
