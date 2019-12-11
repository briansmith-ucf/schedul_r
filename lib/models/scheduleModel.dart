class Schedule
{
  List<Semester> semesterList;
  Schedule({this.semesterList});

  factory Schedule.fromJson(List<dynamic> parsedJson){

    var list = parsedJson;
    List<Semester> semesters = list.map((i) => Semester.fromJson(i)).toList();

    return Schedule(
        semesterList: semesters
    );
  }
}

class Semester
{
  List<Course> courseList;

  Semester({this.courseList});
  factory Semester.fromJson(List <dynamic> parsedJson){

    var list = parsedJson;
    List<Course> courses = list.map((i) => Course.fromJson(i)).toList();

    return Semester(
        courseList: courses
    );
  }
}

class Course
{
  int course_id;
  String code;
  String name;
  String catalog;
  String description;
  int hours;

  Course({this.course_id, this.code, this.name, this.catalog, this.hours, this.description});

  factory Course.fromJson(Map<String, dynamic> parsedJson){
    return Course(
        catalog: parsedJson['catalog'],
        code : parsedJson['code'],
        course_id : parsedJson['course_id'],
        description : parsedJson['description'],
        hours : parsedJson['hours'],
        name: parsedJson['name']
    );
  }
}