class Building {
  final String blgName;
  final String location;

  Building({required this.blgName, required this.location});
  Building.fromJson(Map<String, dynamic> json)
        : blgName = json['blgName'],
         location = json['location'];
        
      Map<String, dynamic> toJson()=>{
        "blgName":blgName,
        "location":location
      };
}
