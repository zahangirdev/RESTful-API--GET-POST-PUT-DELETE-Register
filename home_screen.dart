import 'package:flutter/material.dart';
import 'package:flutter_complate_e_commerce_app_provider/model.dart';
import 'package:flutter_complate_e_commerce_app_provider/update_display.dart';

import 'service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

UpdateModel updateData = UpdateModel();

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  UpdateModel updateData = UpdateModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Api call"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
              TextFormField(
                controller: jobController,
                decoration: const InputDecoration(
                  labelText: "Job",
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    MyApiService()
                        .updateData(nameController.text.toString(),
                            jobController.text.toString())
                        .then((value) {
                      setState(() {
                        updateData = value!;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateDisplay(
                              updateModel: updateData,
                              name: updateData.name.toString(),
                              job: updateData.job.toString(),
                              updatedAT: updateData.updatedAt.toString(),
                            ),
                          ),
                        );
                      });
                    });
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
