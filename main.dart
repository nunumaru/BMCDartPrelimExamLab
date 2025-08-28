import 'dart:io';

void main() {
  const double passingGradeThreshold = 60.0;
  const double maximumPossibleScore = 100.0;
  const double assignmentWeight = 0.2;
  const double midtermWeight = 0.3;
  const double finalExamWeight = 0.5;

  stdout.write("Enter Student's name: ");
  String? studentNameInput = stdin.readLineSync();
  String studentName = (studentNameInput == null || studentNameInput.trim().isEmpty) ? 'Unknown student' : studentNameInput.trim();

  double assignmentScore = _getNumericInput("Enter assignment score (0-$maximumPossibleScore): ");
  double midtermScore = _getNumericInput("Enter midterm score (0-$maximumPossibleScore): ");
  double finalExamScore = _getNumericInput("Enter final score (0-$maximumPossibleScore): ");

  double finalGrade = (assignmentScore * assignmentWeight) + (midtermScore * midtermWeight) + (finalExamScore * finalExamWeight);

  String passFailStatus;
  if (finalGrade >= passingGradeThreshold) {
    passFailStatus = 'Passed';
  } else {
    passFailStatus = 'Failed';
  }

  print('\n--- Student Grade Report ---');
  print('Student Name: $studentName');
  print('Assignment Score: ${assignmentScore.toStringAsFixed(1)}');
  print('Midterm Score: ${midtermScore.toStringAsFixed(1)}');
  print('Final Exam Score: ${finalExamScore.toStringAsFixed(1)}');

  print('Calculated Final Grade: ${finalGrade.toStringAsFixed(1)}');
  print('Result: $passFailStatus');
}

double _getNumericInput(String prompt) {
  stdout.write(prompt);
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    stderr.writeln('Error: Input cannot be empty. Exiting.');
    exit(1);
  }

  try {
    return double.parse(input);
  } on FormatException {
    stderr.writeln('Error: Invalid format for "$input". Enter a valid number. Exiting.');
    exit(1);
  }
}