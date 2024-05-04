

import 'package:strategy_design_pattern/germany_tax_strategy/isalary_tax_strategy.dart';

class AmericanTaxStrategy implements ISalaryTaxStrategy {
  @override
  String label = "American Tax";

  @override
  double calculateTax(int salary) {
    if (salary < 2000) {
      return 0;
    } else if (salary >= 2000) {
      return salary * .2;
    }
    return salary * .3;
  }

}