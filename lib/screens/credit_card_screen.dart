import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';



class CreditCardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isAllActiveG = false;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            SizedBox(height: 90,),
            // IMAGEN DE TARJETA DE CREDITO
            Image(image: const AssetImage('assets/computer.png'), height: size.height * 0.3, fit: BoxFit.fill,),
        
            // InputText('Nombre completo'),
            // InputText('0000 0000 0000 0000'),
            InputText('(+51) 999 999 999'),
            
            
            Row(
              children: [
                Container(
                  width: size.width * 0.5,
                  child: InputText('01/24')
                ),
                Container(
                  width: size.width * 0.5,
                  child: InputText('000')
                ),
              ],
            ),
        
            AllCheckBox(isAllActive: isAllActiveG),
            CheckBox(),
            CheckBox(),
            CheckBox(),
            
        
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: MaterialButton(
                minWidth: double.infinity,
                onPressed: (){},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Borde redondeado
                ),
                child: Text('Pagar', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                color: Colors.indigo,
              ),
            )
        
          
          ],
        ),
      ),
   );
  }
}

class AllCheckBox extends StatefulWidget {
  bool isAllActive;

  AllCheckBox({super.key, required this.isAllActive});

  @override
  State<AllCheckBox> createState() => _AllCheckBoxState();
}

class _AllCheckBoxState extends State<AllCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          setState(() {
            widget.isAllActive = !widget.isAllActive;
          });
          print('ejecutando..');
        },
        title: Text('Aceptos términos y condiciones'),
        leading: Checkbox(
          value: widget.isAllActive, 
          onChanged: (value) {
            setState(() {
              widget.isAllActive = !widget.isAllActive;
            });
          },
        ),
      ),
    );
  }
}


class CheckBox extends StatefulWidget {

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isActive = false;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          setState(() {
            isActive = !isActive;
          });
        },
        title: Text('Aceptos términos y condiciones'),
        leading: Checkbox(
          value: isActive, 
          onChanged: (value) {
            setState(() {
              isActive = !isActive;
            });
          },
        ),
      ),
    );
  }
}


class InputText extends StatelessWidget {
  final phoneNumberFormatter = MaskTextInputFormatter(
    mask: '(+51) ### ### ###', 
    filter: { "#": RegExp(r'[0-9]') },
    // type: MaskAutoCompletionType.lazy
  );

  final String hintText;
  InputText(this.hintText);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 10),
      margin: const EdgeInsets.symmetric( horizontal: 15, vertical: 5),
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black26)
       ),
       child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [phoneNumberFormatter],
        decoration: InputDecoration(
          // errorBorder: InputBorder.none,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 5),
          hintText: hintText
        ),
       ),
    );
  }
}