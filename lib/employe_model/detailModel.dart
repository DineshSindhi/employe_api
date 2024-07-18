class DetailModel{
  int? id;
  int? employee_salary;
  int? employee_age;
  String? employee_name;
  String?profile_image;
  DetailModel({required this.id,required this.employee_age,required this.employee_name,required this.employee_salary,required this.profile_image});
  factory DetailModel.fromJson(Map<String,dynamic>json){
    return DetailModel(
        id: json['id'],
        employee_age: json['employee_age'],
        employee_name: json['employee_name'],
        employee_salary: json['employee_salary'],
        profile_image: json['profile_image']);
  }
}