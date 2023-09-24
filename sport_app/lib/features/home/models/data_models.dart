class DataResponse {
  List<Types>? types;

  DataResponse({types});

  DataResponse.fromJson(Map<String, dynamic> json) {
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Types {
  String? name;
  String? icon;
  List<CourseList>? courseList;

  Types({name, icon, courseList});

  Types.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['courseList'] != null) {
      courseList = <CourseList>[];
      json['courseList'].forEach((v) {
        courseList!.add(CourseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    if (courseList != null) {
      data['courseList'] = courseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseList {
  String? name;
  String? description;
  String? timeIn;
  String? timeOut;

  CourseList({name, description, timeIn, timeOut});

  CourseList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    timeIn = json['timeIn'];
    timeOut = json['timeOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['timeIn'] = timeIn;
    data['timeOut'] = timeOut;
    return data;
  }
}
