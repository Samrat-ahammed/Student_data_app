import 'package:get/get.dart';
import 'package:getxandlistviebuilder/students_models.dart';

class HomeController extends GetxController {
  List<StudentModels> studentlist = [];
  allStudentData(StudentModels studentModels) {
    studentlist.add(studentModels);
    update();
  }
}
