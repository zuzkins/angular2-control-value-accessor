import 'package:angular2/core.dart';
import 'dart:math' as math;

@Component(
  selector: 'example',
  template: r'''
  <rounding-field [(ngModel)]="data['amount']"></rounding-field>
  <pre>
    {{ data }}
  </pre>
''')
class Example {

  math.Random r = new math.Random();

  Map data = {};

  Example() {
    double amount = r.nextDouble() * 1000;
    data = {'amount': amount.toString()};
  }
}
