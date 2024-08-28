import 'package:flutter/material.dart';
import 'package:task/components/app_logo.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _formKey = GlobalKey<FormState>();

   final TextEditingController _societynameController = TextEditingController();
   final TextEditingController _address1Controller = TextEditingController();
   final TextEditingController _address2Controller = TextEditingController();
   final TextEditingController _phone1Controller = TextEditingController();
   final TextEditingController _person1nameController = TextEditingController();
   final TextEditingController _person2nameController = TextEditingController();
   final TextEditingController _phone2Controller = TextEditingController();

  void clearFormFields() {
    _societynameController.clear();
    _address1Controller.clear();
    _address2Controller.clear();
    _phone1Controller.clear();
    _person1nameController.clear();
    _person2nameController.clear();
    _phone2Controller.clear();
  }

  Future<dynamic> postData() async{
   try{

     final url = Uri.parse('https://societypro.in/socapp/Admin/add_society_data');
     final response = await http.post(url,
       body: {
         'society_name': _societynameController.text,
         'address1': _address1Controller.text,
         'address2': _address2Controller.text,
         'contact_person_name_1': _person1nameController.text,
         'contact_person_1_phone': _phone1Controller.text,
         'contact_person_name_2': _person2nameController.text,
         'contact_person_2_phone': _phone2Controller.text,
       },
     );
     if(response.statusCode == 200){
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Submitted Successfully')));
     }else{
       print('Failed to load data');
     }
   }catch(e){
     print(e.toString());
   }
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
              minWidth: 0.0
          ),
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                        child: TextFormField(
                          controller: _societynameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: 'Society Name',
                            hintText: 'Enter your society name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your society name';
                            }
                            return null;
                          },
                          onSaved: (value){
                            _societynameController.text = value!;
                          },
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
                    TextFormField(
                      controller: _address1Controller,
                      keyboardType: TextInputType.streetAddress,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        labelText: 'Address 1',
                        hintText: 'Enter your address',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter address 1';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _address1Controller.text = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _address2Controller,
                      keyboardType: TextInputType.streetAddress,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        labelText: 'Address 2',
                        hintText: 'Enter your address',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter address 2';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _address2Controller.text = value!;
                      },
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
                    TextFormField(
                      controller: _person1nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter person 1 name';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _person1nameController.text = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phone1Controller,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        hintText: 'Enter your phone number',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter phone number';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _phone1Controller.text = value!;
                      },
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
                    TextFormField(
                      controller: _person2nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _person2nameController.text = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phone2Controller,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        hintText: 'Enter your phone number',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _phone2Controller.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                           postData().then((_) => {
                             clearFormFields(),
                           });
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}