import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool obscure = true;

  Future login(String phone,String password)async {
    try{
      final userData = {
          "phone_no" : phone,
          "password" : password,
      };
      final Uri url = Uri.parse('https://societypro.in/socapp/Admin/login_api');
      final response = await http.post(url,
          body: userData,
      );
      if(response.statusCode == 200){
        Navigator.pushReplacementNamed(context, '/home');
      }else{
        print('Unable to login');
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/undraw_Mobile_login_re_9ntv.png'),
                height: 250,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter Your phone number',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Phone number is required';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _phoneController.text = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: obscure,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Your Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                            child: Icon( obscure ? Icons.visibility_off : Icons.visibility))),

                    onSaved: (value){
                      _passwordController.text = value!;
                    },
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                            if(_formKey.currentState!.validate()){
                              login(_phoneController.text.toString(),_passwordController.text.toString());
                            }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
