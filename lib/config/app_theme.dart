import 'package:flutter/material.dart';

const Color _customColor= Color(0xFF5C11D4); //creando color personalizado

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,

]; // lista que va a contener todos los colres que vamos a crear

class AppTheme {

  final int selectColor;

  AppTheme({
    this.selectColor = 0
  }):assert(selectColor >=0 && selectColor <= _colorThemes.length -1, 
  'El indice de color tiene que estar entre 0 y ${_colorThemes.length-1}' );

  


  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectColor],
      //brightness: Brightness.dark // modo oscuro
      
    );
    
  }

}