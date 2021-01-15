import 'package:flutter/material.dart';
import 'package:practice/models/postModel.dart';
import 'package:practice/services/post_api_manager.dart';

class PostapiUI extends StatefulWidget {
  @override
  _PostapiUIState createState() => _PostapiUIState();
}

class _PostapiUIState extends State<PostapiUI> {
  UserModel _user;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            //Two textfield above
            TextField(
              decoration: InputDecoration(
                  labelText: 'Name', hintText: 'Enter Anything'),
              controller: nameController,
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: 'Job', hintText: 'Enter Anything'),
              controller: jobController,
            ),
            SizedBox(
              height: 32,
            ),

            //Submit Button
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () async {
                    final String name = nameController.text;
                    final String jobTitle = jobController.text;
                    final UserModel user = await createUser(name, jobTitle);
                    setState(() {
                      _user = user;
                    });
                  },
                  child: Text(
                    "Result",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
            _user == null
                ? Container()
                : Flexible(
                    //Data coming after clicking on submit button.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Random id.: ${_user.id}"),
                        Text("User Name: ${_user.name}"),
                        Text("User Work: ${_user.job}"),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
