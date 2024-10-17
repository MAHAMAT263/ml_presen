import 'package:flutter/material.dart';

void main() {
  runApp(MultivariablePredictionApp());
}

class MultivariablePredictionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multivariable Prediction',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultivariablePrediction(),
    );
  }
}

class MultivariablePrediction extends StatefulWidget {
  @override
  _MultivariablePredictionState createState() =>
      _MultivariablePredictionState();
}

class _MultivariablePredictionState extends State<MultivariablePrediction> {
  String predictionResult = '';
  List<String> history = [];
  double hoursStudied = 0.0;
  double attendance = 0.0;
  double previousGrade = 0.0;

  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _attendanceController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();

  // Dummy function for UI, no real prediction logic
  void predictOutcome() {
    setState(() {
      predictionResult = 'Prediction result will appear here';
      history.add('Prediction: $hoursStudied');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Multivariable Prediction',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Make the body scrollable
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the left
            children: [
              Text(
                'Welcome to the Multivariable Prediction App! This app allows you to input multiple variables and predict a possible outcome based on these factors. Simply fill out the fields below with relevant data to get started.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),

              // Input for hours studied
              TextField(
                controller: _hoursController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'First variable',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    hoursStudied = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              Text(
                'The First variable could represent important factor and This will influence the overall prediction.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 40),

              // Input for attendance percentage
              TextField(
                controller: _attendanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Second variable',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    attendance = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              Text(
                'The second variable could represent another important factor and could influence the overall prediction.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),

              // Input for previous grade
              TextField(
                controller: _gradeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Third variable',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    previousGrade = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              Text(
                'The Third variable could represent another important factor which could influence the overall prediction.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),

              // Predict Button
              Center(
                child: ElevatedButton(
                  onPressed: predictOutcome,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600], // Background color
                    foregroundColor: Colors.white, // Text color
                  ),
                  child: Text('Predict'),
                ),
              ),
              SizedBox(height: 10),

              // Display the result
              Text(
                predictionResult.isNotEmpty ? predictionResult : '',
                style: TextStyle(fontSize: 18),
              ),

              // History of predictions
              ListView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // Disable scrolling for the list
                shrinkWrap: true, // Use only as much space as needed
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    child: ListTile(
                      title: Text(
                        history[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

