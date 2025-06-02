import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String clientId;
  final String clientName;
  final String clientAddress;
  final String clientEmail;
  final String registrationDate;
  final String clientType;
  final String clientPhone;

  const Details({
    Key? key,
    required this.clientId,
    required this.clientName,
    required this.clientAddress,
    required this.clientEmail,
    required this.registrationDate,
    required this.clientType,
    required this.clientPhone,
  }) : super(key: key);

  Widget _buildTile(String title, String value, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del Cliente"),
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildTile("ID del Cliente", clientId, Icons.numbers),
          _buildTile("Nombre", clientName, Icons.person),
          _buildTile("Dirección", clientAddress, Icons.location_on),
          _buildTile("Correo Electrónico", clientEmail, Icons.email),
          _buildTile("Fecha de Registro", registrationDate, Icons.calendar_today),
          _buildTile("Tipo de Cliente", clientType, Icons.category),
          _buildTile("Teléfono", clientPhone, Icons.phone),
        ],
      ),
    );
  }
}