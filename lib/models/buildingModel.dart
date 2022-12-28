class Building {
  final String blgName;
  final String location;
  String? id;

  Building({required this.blgName, required this.location, required this.id});
  Building.fromJson(Map<String, dynamic> json)
        : blgName = json['blgName'],
         location = json['location'],
         id = json['id'];
        
      Map<String, dynamic> toJson()=>{
        "blgName":blgName,
        "location":location,
        "id": id
      };
}
