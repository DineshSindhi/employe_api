import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'employe_model/em_data.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  EmDataModel? mEmp;
  @override
  void initState() {
   getEmployee();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employee Detail'),centerTitle: true,),
      body: mEmp !=null?
          mEmp!.data!.isNotEmpty?
              ListView.builder(
                itemCount: mEmp!.data!.length,
                itemBuilder: (context, index) {
               return ListTile(
                  title: Text('Name - ${mEmp!.data![index].employee_name}'),
                  subtitle: Text('Salary - ${mEmp!.data![index].employee_salary}'),
                  trailing: Text('Age - ${mEmp!.data![index].employee_age}'),
                );})
              :Center(child: Text('No Employee Details'),)
          :Center(child: CircularProgressIndicator(),)
    );
  }

   getEmployee()async{
    String url ='https://dummy.restapiexample.com/api/v1/employees';
    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var mData=response.body;
      var rawData=jsonDecode(mData);
      mEmp=EmDataModel.fromJson(rawData);
      setState(() {

      });
    }
   }
}
