
import 'package:strategy_design_pattern/germany_tax_strategy/isalary_tax_strategy.dart';

class GermanyTaxStrategy implements ISalaryTaxStrategy {
  @override
  String label = "Germany Tax";

  @override
  double calculateTax(int salary) {
    if (salary < 10000) {
      return salary * .25;
    } else if (salary >= 10000 || salary < 30000) {
      return salary * .35;
    }
    else if (salary > 30000) {
      return salary * .45;
    }

    return 0;
  }

}