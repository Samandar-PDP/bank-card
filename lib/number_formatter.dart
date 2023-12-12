import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  final int divideNumber;
  final String spacer;
  CardNumberInputFormatter(this.divideNumber, this.spacer);
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % divideNumber == 0 && nonZeroIndex != text.length) {
        buffer.write(spacer);
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}