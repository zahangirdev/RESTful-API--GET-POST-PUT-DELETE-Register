import 'package:flutter/material.dart';
import 'package:flutter_complate_e_commerce_app_provider/model.dart';

class UpdateDisplay extends StatelessWidget {
  final String? name, job, updatedAT;
  final UpdateModel updateModel;
  const UpdateDisplay({
    super.key,
    this.name,
    this.job,
    this.updatedAT,
    required this.updateModel,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update View"),
      ),
      body: Center(
        child: Card(
            elevation: 15,
            child: ListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: Text("Name : $name"),
              subtitle: Text("updateAT : $updatedAT"),
              trailing: Text("job : $job"),
            )),
      ),
    );
  }
}
