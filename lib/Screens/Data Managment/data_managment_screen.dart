import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sgs/Screens/Data%20Managment/sheets_columns.dart';
import 'package:sgs/UI%20Components/data_text_form_field.dart';

import '../../Utils/Main_Variables.dart';
import 'google_sheets.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}
class _DataScreenState extends State<DataScreen> {
  TextEditingController expensesController = TextEditingController();
  TextEditingController equipmentController = TextEditingController();
  TextEditingController salesController = TextEditingController();
  TextEditingController budgetingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(mainColor),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/Others/Logo.jpg')),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 55),
                  child: Text(
                    "Smart Green System",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),

              DataTextFieldForm(hint: "Expenses", controller: expensesController),

              DataTextFieldForm(hint: "Equipment and supply costs", controller: equipmentController),

              DataTextFieldForm(hint: "Sales and revenue tracking", controller: salesController),

              DataTextFieldForm(hint: "Budgeting and forecasting", controller: budgetingController),

              const SizedBox(
                height: 10,
              ),

              GestureDetector(
                onTap: () async{
                  final feedback = {
                    SheetColumn.expenses: expensesController.text.trim(),
                    SheetColumn.equipment: equipmentController.text.trim(),
                    SheetColumn.sales: salesController.text.trim(),
                    SheetColumn.budgeting: budgetingController.text.trim(),
                  };
                  await SheetsFlutter.insert([feedback]);
                },
                child: Container(
                  height: 70,
                  width: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Center(child: Text("Send to Sheets", style: TextStyle(color: HexColor(mainColor)),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
