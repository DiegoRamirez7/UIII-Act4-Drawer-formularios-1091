import 'package:flutter/material.dart';
import 'package:myapp/details_empleados.dart';

class FormEmpleados extends StatefulWidget {
  const FormEmpleados({Key? key}) : super(key: key);

  @override
  State<FormEmpleados> createState() => _FormEmpleadosState();
}

class _FormEmpleadosState extends State<FormEmpleados> {
  final _formKey = GlobalKey<FormState>();

  final _idEmpleadoController = TextEditingController();
  final _nombreEmpleadoController = TextEditingController();
  final _telefonoEmpleadoController = TextEditingController();
  final _correoElectronicoController = TextEditingController();
  final _puestoEmpleadoController = TextEditingController();
  final _fechaContratacionController = TextEditingController();

  bool isSubmitting = false;

  @override
  void dispose() {
    _idEmpleadoController.dispose();
    _nombreEmpleadoController.dispose();
    _telefonoEmpleadoController.dispose();
    _correoElectronicoController.dispose();
    _puestoEmpleadoController.dispose();
    _fechaContratacionController.dispose();
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
        backgroundColor: const Color.fromARGB(255, 16, 200, 233),
        title: const Text("EMPLEADOS"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              MyTextField(
                myController: _idEmpleadoController,
                fieldName: "ID DEL EMPLEADO",
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
                myController: _nombreEmpleadoController,
                fieldName: "NOMBRE DEL EMPLEADO",
                myIcon: Icons.person,
                prefixIconColor: Colors.deepPurple.shade300,
              ),
              const SizedBox(height: 10.0),

              MyTextField(
                myController: _telefonoEmpleadoController,
                fieldName: "TELÉFONO DEL EMPLEADO",
                myIcon: Icons.phone,
                prefixIconColor: Colors.deepPurple.shade300,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10.0),

              MyTextField(
                myController: _correoElectronicoController,
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
                myController: _puestoEmpleadoController,
                fieldName: "PUESTO DEL EMPLEADO",
                myIcon: Icons.work,
                prefixIconColor: Colors.deepPurple.shade300,
              ),
              const SizedBox(height: 10.0),

              MyTextField(
                myController: _fechaContratacionController,
                fieldName: "FECHA DE CONTRATACIÓN",
                myIcon: Icons.calendar_today,
                prefixIconColor: Colors.deepPurple.shade300,
                readOnly: true,
                onTap: () => _selectDate(_fechaContratacionController),
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
                              clientId: _idEmpleadoController.text,
                              clientName: _nombreEmpleadoController.text,
                              clientAddress: _telefonoEmpleadoController.text,
                              clientEmail: _correoElectronicoController.text,
                              registrationDate: _fechaContratacionController.text,
                              clientType: _puestoEmpleadoController.text,
                              clientPhone: '', // este campo ya no se usa
                            ),
                          ),
                        ).then((_) {
                          setState(() {
                            isSubmitting = false;
                            _idEmpleadoController.clear();
                            _nombreEmpleadoController.clear();
                            _telefonoEmpleadoController.clear();
                            _correoElectronicoController.clear();
                            _puestoEmpleadoController.clear();
                            _fechaContratacionController.clear();
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
      validator: validator ?? (value) {
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
