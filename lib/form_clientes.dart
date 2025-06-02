import 'package:flutter/material.dart';
import 'package:myapp/details_clientes.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _registrationDateController = TextEditingController();
  final _clientTypeController = TextEditingController();
  final _telDateController = TextEditingController();

  bool isSubmitting = false;

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _registrationDateController.dispose();
    _clientTypeController.dispose();
    _telDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null) {
      controller.text =
          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text("CLIENTES"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              MyTextField(
                myController: _idController,
                fieldName: "ID DEL CLIENTE",
                myIcon: Icons.numbers,
                prefixIconColor: Colors.deepPurple.shade300,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo requerido';
                  if (int.tryParse(value) == null) return 'Debe ser numérico';
                  return null;
                },
              ),
              const SizedBox(height: 10.0),

              MyTextField(
                myController: _nameController,
                fieldName: "NOMBRE DEL CLIENTE",
                myIcon: Icons.text_fields,
                prefixIconColor: Colors.deepPurple.shade300,
              ),
              const SizedBox(height: 10.0),

              MyTextField(
                myController: _addressController,
                fieldName: "DIRECCIÓN",
                myIcon: Icons.location_on,
                prefixIconColor: Colors.deepPurple.shade300,
              ),
              const SizedBox(height: 10.0),

              MyTextField(
                myController: _emailController,
                fieldName: "CORREO ELECTRÓNICO",
                myIcon: Icons.email,
                prefixIconColor: Colors.deepPurple.shade300,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo requerido';
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(value)) return 'Correo inválido';
                  return null;
                },
              ),
              const SizedBox(height: 10.0),

              MyTextField(
                myController: _registrationDateController,
                fieldName: "FECHA DE REGISTRO",
                myIcon: Icons.calendar_today,
                prefixIconColor: Colors.deepPurple.shade300,
                readOnly: true,
                onTap: () => _selectDate(_registrationDateController),
              ),
              const SizedBox(height: 10.0),

              MyTextField(
                myController: _clientTypeController,
                fieldName: "TIPO DE CLIENTE",
                myIcon: Icons.category,
                prefixIconColor: Colors.deepPurple.shade300,
              ),
              const SizedBox(height: 10.0),

              MyTextField(
                myController: _telDateController,
                fieldName: "TELEFONO DEL CLIENTE",
                myIcon: Icons.text_fields,
                prefixIconColor: Colors.deepPurple.shade300,
              ),
              const SizedBox(height: 10.0),

             OutlinedButton(
  style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
  onPressed: isSubmitting
      ? null
      : () {
          if (!_formKey.currentState!.validate()) return;

          setState(() {
            isSubmitting = true;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(
                clientId: _idController.text,
                clientName: _nameController.text,
                clientAddress: _addressController.text,
                clientEmail: _emailController.text,
                registrationDate: _registrationDateController.text,
                clientType: _clientTypeController.text,
                clientPhone: _telDateController.text,
              ),
            ),
          ).then((_) {
            setState(() {
              isSubmitting = false;
              _idController.clear();
              _nameController.clear();
              _addressController.clear();
              _emailController.clear();
              _registrationDateController.clear();
              _clientTypeController.clear();
              _telDateController.clear();
            });
          });
        },
  child: isSubmitting
      ? const CircularProgressIndicator()
      : Text(
          "Enviar Formulario".toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.onTap,
    this.validator,
  }) : super(key: key);

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;
  final bool enabled;
  final bool readOnly;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      enabled: enabled,
      readOnly: readOnly,
      keyboardType: keyboardType,
      onTap: onTap,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Campo requerido';
            }
            return null;
          },
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        labelStyle: const TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}