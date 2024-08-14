import 'package:flutter/material.dart';
import 'package:task/components/app_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _societynameController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _phone1Controller = TextEditingController();
  final TextEditingController _person1nameController = TextEditingController();
  final TextEditingController _person2nameController = TextEditingController();
  final TextEditingController _phone2Controller = TextEditingController();

  int _count = 0;

  void incrementCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const AppLogo(),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              tooltip: 'Logout',
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
              minHeight: 800,
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              minWidth: 0.0),
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to our app',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text(
                        'Society Name',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  Row(children: [
                    Expanded(
                      child: TextField(
                        controller: _societynameController,
                        decoration: const InputDecoration(
                          labelText: 'Society Name',
                          hintText: 'Enter your society name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ]),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text(
                        'Society Information',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  TextField(
                    controller: _address1Controller,
                    keyboardType: TextInputType.streetAddress,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Address 1',
                      hintText: 'Enter your address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _address2Controller,
                    keyboardType: TextInputType.streetAddress,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Address 2',
                      hintText: 'Enter your address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(children: const [
                    Text(
                      'Person 1 Contact Information',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ]),
                  const Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  TextField(
                    controller: _person1nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _phone1Controller,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Enter your phone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text(
                        'Person 2 Contact Information',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(height: 10, color: Colors.black),
                  TextField(
                    controller: _person2nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _phone2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Enter your phone number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_societynameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Please enter your first name')));
                        } else if (_address1Controller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Please enter your address 1')));
                        } else if (_address2Controller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Please enter your address 2')));
                        } else if (_phone1Controller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Please enter person 1 phone')));
                        } else if (_phone2Controller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Please enter person 2 phone')));
                        } else if (_person1nameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please enter person 1 name')));
                        } else if (_person2nameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please enter person 2 name')));
                        } else {
                          incrementCount();
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Text(
                    'Already Fill Form Count: $_count',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
