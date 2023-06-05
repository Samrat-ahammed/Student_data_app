import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxandlistviebuilder/home_controller.dart';
import 'package:getxandlistviebuilder/students_models.dart';

class HomePage extends StatelessWidget {
  String? name;
  String? studentClass;
  String? roll;
  String? age;
  final fromKey = GlobalKey<FormState>();

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Student Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Form(
                key: fromKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' please enter your name';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        name = newValue.toString();
                      },
                    ),
                    space(),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Class'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your class';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        studentClass = newValue.toString();
                      },
                    ),
                    space(),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Roll'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your roll';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        roll = newValue.toString();
                      },
                    ),
                    space(),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Age'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your age';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        age = newValue.toString();
                      },
                    ),
                  ],
                ),
              ),
              space(),
              MaterialButton(
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    fromKey.currentState!.save();
                    homeController.allStudentData(StudentModels(name.toString(),
                        studentClass.toString(), roll.toString(), age ?? ''));
                  }
                },
                child: const Text('Press'),
                color: Colors.grey,
              ),
              space(),
              GetBuilder<HomeController>(builder: (context) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: homeController.studentlist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ListTile(
                          title: Text(
                            homeController.studentlist[index].name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          leading: Text(
                            homeController.studentlist[index].studentClass,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          trailing: Text(
                            homeController.studentlist[index].age,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          tileColor: Colors.grey,
                        ),
                      );
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  SizedBox space() {
    return const SizedBox(
      height: 10,
    );
  }
}
