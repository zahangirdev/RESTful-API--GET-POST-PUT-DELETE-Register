import 'package:flutter/material.dart';
import 'package:flutter_complate_e_commerce_app_provider/api_service.dart';

import 'get_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommentModel> commentModel = [];
  getComments() {
    GetApiService().getCommentsModel().then(
      (value) {
        setState(() {
          commentModel = value!;
        });
      },
    );
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Api Calls'),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: commentModel.length,
          itemBuilder: (context, index) {
            final apidata = commentModel[index];
            return Material(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Text(
                      apidata.id.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.175,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          apidata.name.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          apidata.email.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          apidata.body.toString(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
