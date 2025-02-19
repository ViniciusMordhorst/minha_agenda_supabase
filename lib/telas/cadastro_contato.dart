import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadastroContato extends StatefulWidget {
  const CadastroContato({super.key});

  @override
  State<CadastroContato> createState() => _CadastroContatoState();
}

class _CadastroContatoState extends State<CadastroContato> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _nascimentoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _mostrarSenha = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _telefoneController.dispose();
    _nascimentoController.dispose();

    super.dispose();
  }

  Future<void> _abrirCalendario(BuildContext context) async {
    final DateTime? data = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      currentDate: DateTime.now(),
    );

    if (data != null) {
      setState(() {
        _nascimentoController.text = DateFormat("dd/MM/yyyy").format(data).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    "Cadastro de novo Contato",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.lightGreen[900],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  controller: _nomeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    filled: true,
                    fillColor: Colors.lightGreen[100],
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreen[900],
                      fontWeight: FontWeight.w700,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.lightGreen[900],
                    fontSize: 18,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo é obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _telefoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    filled: true,
                    fillColor: Colors.lightGreen[100],
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreen[900],
                      fontWeight: FontWeight.w700,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.lightGreen[900],
                    fontSize: 18,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo é obrigatório';
                    }
                    if (!value.contains('@') || !value.contains(".")) {
                      return 'E-mail é inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nascimentoController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Data de Nascimento',
                    suffixIcon: IconButton(
                      onPressed: () => _abrirCalendario(context),
                      icon: Icon(Icons.calendar_month_outlined),
                    ),
                    suffixIconColor: Colors.lightGreen[700],
                    filled: true,
                    fillColor: Colors.lightGreen[100],
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreen[900],
                      fontWeight: FontWeight.w700,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.lightGreen[900],
                    fontSize: 18,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo é obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen[700],
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "Criar contato",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
