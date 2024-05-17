import 'package:flutter/material.dart';

void main() {
  runApp(const DynamicTextField());
}

class DynamicTextField extends StatefulWidget {
  const DynamicTextField({super.key});

  @override
  State<DynamicTextField> createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dynamic Text Field'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(txtControllerList.length,(index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: TextField(
                    controller: txtControllerList[index],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.black
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2
                        )
                      ),
                      hintText: 'Skill',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 17
                      )
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {
                        TextEditingController txtController = TextEditingController();
                        setState(() {
                          txtControllerList.add(txtController);
                        });
                      }, icon: Icon(Icons.add_box_outlined,size: 30,)),
                      IconButton(onPressed: () {
                        TextEditingController txtController = TextEditingController();
                        setState(() {
                          txtControllerList.removeAt(index);
                        });
                      }, icon: Icon(Icons.delete,size: 30,))
                    ],
                  ),
                ),
              ), ),
              FloatingActionButton(onPressed: () {
                String skills = txtController.text;

                for(int i=1 ; i<txtControllerList.length;i++)
                  {
                    skills = skills + " " + txtControllerList[i].text;
                  }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content :Text('${skills} ${txtControllerList[1].text}'),

                    ),

                    );

              },child: Icon(Icons.play_arrow),)
            ],
          ),
        ),
      ),
    );
  }
}



TextEditingController txtController = TextEditingController();

List<TextEditingController> txtControllerList = [
  txtController,
];