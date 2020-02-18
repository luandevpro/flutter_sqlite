import 'package:flutter/material.dart';
import 'package:flutter_sqlite/core/constants/app_contstants.dart';

class HomeView extends StatelessWidget {
  Widget _buildTaskItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("Task Item"),
            subtitle: Text('hi'),
            trailing: Checkbox(
              value: true,
              activeColor: Colors.orange,
              onChanged: (value) {
                print(value);
              },
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.Login,
              arguments: 'Data from home');
        },
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "My Task",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('1 of 10', style: TextStyle(fontSize: 20))
                ],
              ),
            );
          }
          return _buildTaskItem();
        },
      ),
    );
  }
}
