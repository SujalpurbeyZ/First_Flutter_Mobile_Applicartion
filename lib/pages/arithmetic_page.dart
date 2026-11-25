import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';




class ArithemeticPage extends StatefulWidget {
  const new({super.key});

  @override
  State<ArithemeticPage> createState() => _ArithemeticPageState();
}

class _ArithemeticPageState extends State<ArithemeticPage> {

  final TextEditingController firstController = TextEditingController(); 
  final TextEditingController secondController = TextEditingController(); 
  double result = 0;

  final _gap = SizedBox(height: 8);


  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 123, 7),
      appBar: AppBar(
        title: Text('Arithemetic operations'),
        centerTitle: true,
      ),
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: firstController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'First Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter first number';
                    }
                    return null;
                  },
                ),
                _gap, 
                TextFormField(
                  controller: secondController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'First Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter second number';
                    }
                    return null;
                  },
                ), 
                SizedBox(
                  width: double.infinity, 
                  child: ElevatedButton(
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                      
                        final first = double.parse(firstController.text.trim());
                        final second = double.parse(secondController.text.trim());
                        setState(() {
                          result = first + second;
                        });
                      }
                    },
                    child: Text("Add")),
                ),
                _gap, 
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final first = double.parse(firstController.text.trim());
                      final second = double.parse(secondController.text.trim());
                      setState(() {
                        result = first - second;
                      });
                    },
                    child: Text("Subtract")),
                ),
                _gap, 
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final first = double.parse(firstController.text.trim());
                      final second = double.parse(secondController.text.trim());
                      setState(() {
                        result = first * second;
                      });
                    },
                    child: Text("Multiply")),
                ),
                _gap, 
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final first = double.parse(firstController.text.trim());
                      final second = double.parse(secondController.text.trim());
                      setState(() {
                        result = first % second;
                      });
                    },
                    child: Text("Divide")),
                ), 
                _gap,
                Text("Result: $result", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ]
            ),
          ),
        ),
      ),
    );
  }
}