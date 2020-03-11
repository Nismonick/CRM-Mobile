// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

class User {
  String palSoftID;
  String fullName;
  int departmentId;
  int coNumber;
  bool isDepartmentHead;
  bool isHomeDepartment;
  bool isReadWrite;

  User(
      {this.palSoftID,
      this.fullName,
      this.departmentId,
      this.coNumber,
      this.isDepartmentHead,
      this.isHomeDepartment,
      this.isReadWrite});

  User.fromJson(Map<String, dynamic> json) {
    palSoftID = json['PalSoftID'];
    fullName = json['FullName'];
    departmentId = json['DepartmentId'];
    coNumber = json['CoNumber'];
    isDepartmentHead = json['IsDepartmentHead'];
    isHomeDepartment = json['IsHomeDepartment'];
    isReadWrite = json['IsReadWrite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PalSoftID'] = this.palSoftID;
    data['FullName'] = this.fullName;
    data['DepartmentId'] = this.departmentId;
    data['CoNumber'] = this.coNumber;
    data['IsDepartmentHead'] = this.isDepartmentHead;
    data['IsHomeDepartment'] = this.isHomeDepartment;
    data['IsReadWrite'] = this.isReadWrite;
    return data;
  }

  
 
}
