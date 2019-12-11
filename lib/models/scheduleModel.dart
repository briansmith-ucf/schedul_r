class Schedule
{
  List<Semester> semesterList;
  Schedule({this.semesterList});
  factory Schedule.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson[''] as List;
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
  factory Semester.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['Course'] as List;
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
  int hours;

  Course({this.course_id, this.code, this.name, this.catalog, this.hours});

  factory Course.fromJson(Map<String, dynamic> parsedJson){
    return Course(
        course_id: parsedJson['course_id'],
        code : parsedJson['code'],
        name : parsedJson['code'],
        catalog : parsedJson['code'],
        hours : parsedJson['code'],
    );
  }
}