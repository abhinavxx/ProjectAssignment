import 'package:flutter/material.dart';
import 'package:practice/models/countryInfo.dart';
import 'package:practice/services/get_api_manager.dart';

class GETapiUI extends StatefulWidget {
  @override
  _GETapiUIState createState() => _GETapiUIState();
}

class _GETapiUIState extends State<GETapiUI> {
  Future<Model> _infoModel;
  bool selected = false;
  @override
  void initState() {
    _infoModel = API_Manager().getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<Model>(
          future: _infoModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.keys.length,
                  itemBuilder: (context, index) {
                    var article = snapshot.data.data;
                    var countrary = article.entries.elementAt(index).value;
                    return Card(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          children: [
                            ListTile(
                              //countryCode
                              leading: CircleAvatar(
                                  child: Text(
                                article.keys.elementAt(index),
                              )),
                              //CountryName
                              title: Text(
                                countrary.country,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              //RegionName
                              subtitle: Text(
                                countrary.toJson().values.last,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Divider(
                              height: 6,
                            )
                          ],
                        ));
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
