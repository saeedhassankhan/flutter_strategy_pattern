import 'package:strategy_design_pattern/germany_tax_strategy/isalary_tax_strategy.dart';

class Employee {
  ISalaryTaxStrategy salaryTaxStrategy;
  String name;
  int salary;

  Employee(
      {required this.salaryTaxStrategy,
        required this.name,
        required this.salary
      });
}