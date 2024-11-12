import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

class SimpleFormWidget extends StatefulWidget {
  const SimpleFormWidget({super.key});

  @override
  State<SimpleFormWidget> createState() => _SimpleFormWidgetState();
}

class _SimpleFormWidgetState extends State<SimpleFormWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _selectedGender;
  List<String> _genders = ['Male', 'Female', 'Other'];

  // Form field controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modern Form UI"),
        backgroundColor: Color(0xFF1976D2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Name Input Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Email Input Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Gender Dropdown
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: _genders.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your gender';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final formWidget = {
  'id': const Uuid().v4(),
  'type': 'scaffold',
  'props': {'colorTheme': '#FFF4F4F4'},
  'body': {
    'id': const Uuid().v4(),
    'type': 'form',
    'props': {
      'padding': {'all': 16.0},
    },
    'children': [
      {
        'type': 'textFormField',
        'props': {
          'decoration': {
            'labelText': 'Username',
            'hintText': 'Enter your username',
            'border': 'outlined'
          },
          'validator': 'required'
        }
      },
      {
        'type': 'textFormField',
        'props': {
          'decoration': {
            'labelText': 'Email',
            'hintText': 'Enter your email',
            'border': 'outlined'
          },
          'validator': 'email'
        }
      },
      {
        'type': 'textFormField',
        'props': {
          'decoration': {
            'labelText': 'Password',
            'hintText': 'Enter your password',
            'border': 'outlined'
          },
          'obscureText': true,
          'validator': 'required'
        }
      },
      {
        'type': 'elevatedButton',
        'props': {
          'child': {
            'type': 'text',
            'props': {
              'data': 'Submit',
              'style': {'color': '#FFFFFFFF'}
            }
          },
          'colorTheme': '#FF2196F3'
        }
      }
    ]
  }
};
