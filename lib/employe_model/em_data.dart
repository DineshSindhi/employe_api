import 'detailModel.dart';

class EmDataModel{
  String?message;
  String?status;
 List<DetailModel>?data;
 EmDataModel({required this.data,required this.message,required this.status});
 factory EmDataModel.fromJson(Map<String,dynamic>json){
   List<DetailModel>mData=[];
   for(Map<String,dynamic>eachEm in json['data']){
     DetailModel model=DetailModel.fromJson(eachEm);
     mData.add(model);
   }
   return EmDataModel(
       data: mData,
       message: json['message'],
       status: json[' status']);
 }
}