import 'dart:io';

/// this part is the very first part of the program
/// in this part you will get the student information.
/// calculate the final grade, and displaying the result.

void main() {
  // Constants Declaration values cannot be changed after you assigned it 
  const double passingGradeScore = 60.0;
  const double maximumPossibleScore = 100.0;
  const double assignmentWeight = 0.2;
  const double midtermWeight = 0.3;
  const double finalExamWeight = 0.5;

  // Inputing users to the student's name
  stdout.write('Enter student\'s name: ');
  String? studentNameInput = stdin.readLineSync();

  // Validate and assign the student's name. If input is null or empty,
  // default to 'Unknown Student'.
  String studentName = (studentNameInput == null || studentNameInput.trim().isEmpty)
      ? 'Unknown Student'
      : studentNameInput.trim();

  // Getting the assignment score by using helper function and ensuring it's a valid number.
  double assignmentScore = _getNumericInput('Enter assignment score (0-$maximumPossibleScore): ');

  // Getting the midterm score by using helper function.
  double midtermScore = _getNumericInput('Enter midterm score (0-$maximumPossibleScore): ');

  // Getting the final exam score by using helper function.
  double finalExamScore = _getNumericInput('Enter final exam score (0-$maximumPossibleScore): ');

  // --- Final Grade Calculation ---
  // Calculating the final grade based on their weighted average scores.
  double finalGrade = (assignmentScore * assignmentWeight) +
                      (midtermScore * midtermWeight) +
                      (finalExamScore * finalExamWeight);

  // --- Determine Pass/Fail Status ---
  String passFailStatus;
  // checking if the final grade is meet or exceeds the passing score.
  if (finalGrade >= passingGradeScore) {
    passFailStatus = 'Passed';
  } else {
    passFailStatus = 'Failed';
  }

  // --- Displaying all the results  ---
  print('\n--- Student Grade Report ---');
  print('Student Name: $studentName');
  // displaying the scores.
  print('Assignment Score: ${assignmentScore.toStringAsFixed(1)}');
  print('Midterm Score: ${midtermScore.toStringAsFixed(1)}');
  print('Final Exam Score: ${finalExamScore.toStringAsFixed(1)}');
  print('----------------------------');
  // displaying the final grade.
  print('Calculated Final Grade: ${finalGrade.toStringAsFixed(1)}');
  // displaying the pass/fail grade.
  print('Result: $passFailStatus');
  print('----------------------------');
}

/// using a helper function to  get the exact numeric input from the user.
double _getNumericInput(String prompt) {
  // displaying the prompt to user.
  stdout.write(prompt);
  // Read the user's input.
  String? input = stdin.readLineSync();

  // checking if the input is null or empty.
  if (input == null || input.isEmpty) {
    stderr.writeln('Error: Input cannot be empty. Exiting program.');
    exit(1); // Exit with a non-zero status code to indicate an error.
  }

  try {
    // Attempt to parse the input string to a double.
    return double.parse(input);
  } on FormatException {
    // Catch the FormatException if parsing fails (e.g., non-numeric input).
    stderr.writeln('Error: Invalid number format for "$input". Please enter a valid number. Exiting program.');
    exit(1); 
  }
}
