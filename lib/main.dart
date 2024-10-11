import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  BMICalculatorState createState() => BMICalculatorState();
}

class BMICalculatorState extends State<BMICalculator> {
  // Các controller để lấy giá trị từ TextField
  final TextEditingController ageInput = TextEditingController();
  final TextEditingController heightInput = TextEditingController();
  final TextEditingController weightInput = TextEditingController();

  String bmiResult = '';
  String bmiStatus = '';

  void calculateBMI() {
    int age = int.parse(ageInput.text);
    double height = double.parse(heightInput.text);
    double weight = double.parse(weightInput.text);

    double bmi = weight / ((height/100) * (height/100));

    String status;
    if(age<=19){
      if(bmi<5){
        status="Thiếu cân";
      }else if(age >=5 && age <=64){
        status = "Bình thường";
      }else{
        status = "béo phì";
      }
    }else if (19<age && age<65){
      if(bmi<18.5){
        status="Thiếu cân";
      }else if(age >=18.5 && age <=25){
        status = "Bình thường";
      }else if (age >25 && age <30){
        status = "thừa cân";
      }else if (age >=30 && age >35){
        status = "béo phì loại 1";
      }else if (age >=35 && age <40){
        status = "béo phì loại 2";
      }else{
        status = "béo phì loại 3";
      }
    }else{
      if(bmi<22){
        status="Thiếu cân";
      }else if(age >=22 && age <=27){
        status = "Bình thường";
      }else{
        status = "béo phì";
      }
    }

    setState(() {
      bmiResult = "BMI: ${bmi.toStringAsFixed(2)}";
      bmiStatus = status;
    });
  }

  void clearFields() {
    ageInput.clear();
    heightInput.clear();
    weightInput.clear();
    setState(() {
      bmiResult = '';
      bmiStatus = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Logo BMI
            Image.network(
              '//upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
              width: 300,
              height: 200,
            ),
            const SizedBox(height: 30),

            TextField(
              controller: ageInput,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: heightInput,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
                prefixIcon: Icon(Icons.bubble_chart),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: weightInput,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                prefixIcon: Icon(Icons.line_weight),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff44336),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )
                  ),
                  child: const Text('Calculate',style: TextStyle(
                        color: Color(0xfffffefe),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: clearFields,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff44336),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )
                  ),
                  child: const Text('Clear',style: TextStyle(
                        color: Color(0xfffffefe),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Hiển thị kết quả BMI
            Text(
              bmiResult,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              bmiStatus,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
