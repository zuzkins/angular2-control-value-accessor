import 'package:angular2/core.dart';
import 'package:angular2/common.dart';

const ROUNDING_FIELD_VALUE_ACCESSOR = const Provider(NG_VALUE_ACCESSOR, useExisting: RoundingField, multi: true);

@Component(
  selector: 'rounding-field',
  templateUrl: 'rounding_field.html',
  providers: const [ROUNDING_FIELD_VALUE_ACCESSOR])
class RoundingField implements ControlValueAccessor {

  double _value;
  double get value => _value;

  @Input()
  set value(obj) {
    num converted;
    if (obj is String) {
      converted = double.parse(obj);
    } else if (obj is num) {
      converted = obj;
    } else {
      converted = null;
    }
    if (converted != null) {
      double newVal = (converted * 1000).floor() / 1000.0;
      if (_value != newVal) {
        _value = newVal;
      }
    }
  }

  void notifyChange() {
    if (onChange != null) {
      onChange(_value);
    }
  }

  var onChange = (_) {};
  var onTouched = (_) {};

  @override
  void registerOnChange(fn) {
    this.onChange = fn;
  }

  @override
  void registerOnTouched(fn) {
    this.onTouched = fn;
  }

  @override
  void writeValue(obj) {
    value = obj;
    notifyChange();
  }

  void inputChanged(double input) {
    value = input;
    notifyChange();
  }
}
