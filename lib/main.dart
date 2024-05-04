import 'package:flutter/material.dart';
import 'package:strategy_design_pattern/germany_tax_strategy/american_tax_strategy.dart';
import 'package:strategy_design_pattern/germany_tax_strategy/germany_tax_strategy.dart';
import 'package:strategy_design_pattern/model/employee.dart';

import 'germany_tax_strategy/isalary_tax_strategy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  List<ISalaryTaxStrategy> salaryStrategies = [
    GermanyTaxStrategy(),
    AmericanTaxStrategy()
  ];
  List<Employee> employees = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,

        title: Text(widget.title),


      ),
      body: Column(children: [
        _taxSelectionWidget(),
        _employeeName(),
        _employeeSalary(),
        _buttonAddEmployee(),
        _listOfEmployees()
      ],),
    );
  }

  Widget _buttonAddEmployee() {
    return GestureDetector(
      onTap: () => {
        addToEmployees()
      },
      child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.green),
      child: Text("ADD Employee", style: TextStyle(color: Colors.white),),),);
  }


  Widget _employeeSalary() {
    return Container(margin: EdgeInsets.all(22),
      width: double.infinity,
      child: TextField(
          controller: salaryController,
          decoration: InputDecoration(hintText: "salary",),
          keyboardType: TextInputType.number),);
  }

  Widget _employeeName() {
    return Container(
      margin: EdgeInsets.all(22),
      width: double.infinity,
      child: TextField(
          controller: nameController,
          decoration: InputDecoration(hintText: "name",),
          keyboardType: TextInputType.text),);
  }

  Widget _taxSelectionWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: salaryStrategies.length, // Number of items in the list
      itemBuilder: (BuildContext context, int index) {
        return RadioListTile(
          title: Text('${salaryStrategies[index].label}'),
          value: index,
          groupValue: selectedIndex,
          onChanged: (value) {
            setState(() {
              selectedIndex = value ?? 0;
            });
          },
        );
      },
    );
  }

  Widget _listOfEmployees() {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: employees.length,
        itemBuilder: (BuildContext context, int index) {
            return Padding(padding: EdgeInsets.all(8), child: Text("employee name is ${employees[index].name} with salary :  tax is : ${employees[index].salaryTaxStrategy.calculateTax(employees[index].salary)}"),);
        });
  }

  addToEmployees(){
    setState(() {
      employees.add(Employee(salaryTaxStrategy: salaryStrategies[selectedIndex!], name: nameController.text, salary: int.parse(salaryController.text)));
    });
  }
}
