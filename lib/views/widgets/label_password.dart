import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'password_generator.dart';

class LabelPassword extends StatefulWidget {
  const LabelPassword({Key? key}) : super(key: key);

  @override
  _LabelPasswordState createState() => _LabelPasswordState();
}

class _LabelPasswordState extends State<LabelPassword> {
  final PasswordGenerator _passwordGenerator = PasswordGenerator();
  int selectedOption = 0;

  @override
  void initState() {
    super.initState();
    _passwordGenerator.generatePasswords();
  }

  void _copyPasswordToClipboard(String password) {
    Clipboard.setData(ClipboardData(text: password));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Contraseña copiada en el portapapeles'),
      ),
    );
  }

  void _generatePasswords() {
    setState(() {
      _passwordGenerator.generatePasswords();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 0,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value as int;
                  _passwordGenerator.includeUppercase = true;
                  _passwordGenerator.includeLowercase = true;
                  _generatePasswords();
                });
              },
            ),
            Text('Fácil de decir'),
            Radio(
              value: 1,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value as int;
                  _passwordGenerator.includeUppercase = true;
                  _passwordGenerator.includeLowercase = true;
                  _passwordGenerator.includeNumbers = true;
                  _passwordGenerator.includeSymbols = true;
                  _generatePasswords();
                });
              },
            ),
            Text('Todos los caracteres'),
          ],
        ),
        IndexedStack(
          index: selectedOption,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _passwordGenerator.passwordElements.join(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _generatePasswords();
                    },
                    child: Text('Generar/Actualizar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _copyPasswordToClipboard(
                          _passwordGenerator.passwordElements.join());
                    },
                    child: Text('Copiar'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _passwordGenerator.secondPasswordElements.join(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _generatePasswords();
                    },
                    child: Text('Generar/Actualizar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _copyPasswordToClipboard(
                          _passwordGenerator.secondPasswordElements.join());
                    },
                    child: Text('Copiar'),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Password Length: '),
              Expanded(
                child: Slider(
                  min: 8,
                  max: 30,
                  value: _passwordGenerator.passwordLength.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _passwordGenerator.passwordLength = value.toInt();
                      _generatePasswords();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        CheckboxListTile(
          title: Text('Mayúsculas'),
          value: _passwordGenerator.includeUppercase,
          onChanged: selectedOption == 1
              ? (value) {
                  setState(() {
                    _passwordGenerator.includeUppercase = value!;
                    _generatePasswords();
                  });
                }
              : null,
        ),
        CheckboxListTile(
          title: Text('Minúsculas'),
          value: _passwordGenerator.includeLowercase,
          onChanged: selectedOption == 1
              ? (value) {
                  setState(() {
                    _passwordGenerator.includeLowercase = value!;
                    _generatePasswords();
                  });
                }
              : null,
        ),
        CheckboxListTile(
          title: Text('Números'),
          value: _passwordGenerator.includeNumbers,
          onChanged: selectedOption == 1
              ? (value) {
                  setState(() {
                    _passwordGenerator.includeNumbers = value!;
                    _generatePasswords();
                  });
                }
              : null,
        ),
        CheckboxListTile(
          title: Text('Símbolos'),
          value: _passwordGenerator.includeSymbols,
          onChanged: selectedOption == 1
              ? (value) {
                  setState(() {
                    _passwordGenerator.includeSymbols = value!;
                    _generatePasswords();
                  });
                }
              : null,
        ),
      ],
    );
  }
}
