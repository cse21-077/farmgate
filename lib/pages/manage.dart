import 'package:farm_gate/pages/cropmanage/trans_screen.dart';
import 'package:farm_gate/pages/yeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class management extends StatefulWidget {
  management({Key? key}) : super(key: key);

  @override
  State<management> createState() => _managementState();
}

class _managementState extends State<management> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Farm Gate Management"),
        backgroundColor: Color.fromARGB(255, 30, 165, 107),
      ),
      body: Column(
        children: [
          Lottie.asset(
            'assets/images/manage.json',
          ),

          //SizedBox(height: 10),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TransactionScreen()));
              },
              label: Text("Financial records"),
              icon: Icon(
                Icons.upload_file,
              ),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(10.0)),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                //MaterialPageRoute(builder: (context) => Yeildcal());
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Yeildcal()));
              },
              icon: Icon(Icons.calculate),
              label: Text("Yeild Calculator"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 50, 12, 164),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.book_online),
              label: Text("livestock Management"),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(10.0)),
            ),
          ),
        ],
      ),
    );
  }
}
