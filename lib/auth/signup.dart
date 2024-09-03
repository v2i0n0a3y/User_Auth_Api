import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _businessNameController = TextEditingController();
  TextEditingController _informalNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();
  TextEditingController _deviceTokenController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _socialIdController = TextEditingController();

  PlatformFile? _registrationProof;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _registrationProof = result.files.first;
      });
    } else {
      // User canceled the picker
    }
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      String url = 'sowlab.com/assignment/user/register'; // Replace with your API endpoint

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['full_name'] = _fullNameController.text;
      request.fields['email'] = _emailController.text;
      request.fields['phone'] = _phoneController.text;
      request.fields['password'] = _passwordController.text;
      request.fields['role'] = _roleController.text;
      request.fields['business_name'] = _businessNameController.text;
      request.fields['informal_name'] = _informalNameController.text;
      request.fields['address'] = _addressController.text;
      request.fields['city'] = _cityController.text;
      request.fields['state'] = _stateController.text;
      request.fields['zip_code'] = _zipCodeController.text;
      request.fields['device_token'] = _deviceTokenController.text;
      request.fields['type'] = _typeController.text;
      request.fields['social_id'] = _socialIdController.text;

      // Adding Business Hours as JSON string
      request.fields['business_hours'] = jsonEncode({
        "mon": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "tue": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "wed": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
        "thu": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
        "fri": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "sat": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "sun": ["8:00am - 10:00am"]
      });

      // Adding the registration proof file
      if (_registrationProof != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'registration_proof',
          _registrationProof!.bytes.toString(),
        ));
      }

      try {
        var response = await request.send();

        if (response.statusCode == 200) {
          var responseData = await response.stream.bytesToString();
          var result = jsonDecode(responseData);
          // Handle success
          print('Sign Up Successful: $result');
        } else {
          // Handle failure
          print('Failed to sign up: ${response.statusCode}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Form fields go here
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Enter your full name' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Enter your email' : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) => value!.isEmpty ? 'Enter your phone number' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Enter your password' : null,
              ),
              TextFormField(
                controller: _roleController,
                decoration: InputDecoration(labelText: 'Role'),
                validator: (value) => value!.isEmpty ? 'Enter your role' : null,
              ),
              TextFormField(
                controller: _businessNameController,
                decoration: InputDecoration(labelText: 'Business Name'),
                validator: (value) => value!.isEmpty ? 'Enter your business name' : null,
              ),
              TextFormField(
                controller: _informalNameController,
                decoration: InputDecoration(labelText: 'Informal Name'),
                validator: (value) => value!.isEmpty ? 'Enter your informal name' : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) => value!.isEmpty ? 'Enter your address' : null,
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) => value!.isEmpty ? 'Enter your city' : null,
              ),
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(labelText: 'State'),
                validator: (value) => value!.isEmpty ? 'Enter your state' : null,
              ),
              TextFormField(
                controller: _zipCodeController,
                decoration: InputDecoration(labelText: 'Zip Code'),
                validator: (value) => value!.isEmpty ? 'Enter your zip code' : null,
              ),
              ElevatedButton(
                onPressed: _pickFile,
                child: Text('Pick Registration Proof'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _signUp,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
