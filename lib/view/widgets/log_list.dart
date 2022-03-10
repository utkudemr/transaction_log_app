import 'package:flutter/material.dart';
import 'package:transaction_log_app/helper/local_storage_helper.dart';

class LogList extends StatefulWidget {
  const LogList({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return LogListState();
  }
}

class LogListState extends State<LogList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String?>>(
      future: SharedPreferenceService.instance
          ?.getStringList("traceLog"), // async work
      builder: (BuildContext context, AsyncSnapshot<List<String?>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return Center(
              child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var txt = snapshot.data![index].toString();
                    var list = txt.split("|");
                    return ListTile(
                        leading: const Icon(Icons.check),
                        subtitle: Text(list[2]),
                        trailing: Text(
                          list[0],
                          style: const TextStyle(
                              color: Colors.green, fontSize: 15),
                        ),
                        title: Text(list[1]));
                  }),
            );
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
        }
      },
    );
  }
}
