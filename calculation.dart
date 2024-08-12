import 'dart:io';
import 'dart:math'; // Importing math for using pi

void main() {
  print("Enter the vertical length of the ground level (in meters): ");
  double vertical_length_of_ground_level = double.parse(stdin.readLineSync()!);

  print("Enter the vertical length above the ground level (in meters): ");
  double vertical_length_of_above_ground_level = double.parse(stdin.readLineSync()!);

  print("Enter the length of the Column (in meters): ");
  double length_of_column = double.parse(stdin.readLineSync()!);

  print("Enter the breadth of the Column (in meters): ");
  double breadth_of_column = double.parse(stdin.readLineSync()!);

  print("Enter the diameter of the Bar (in millimeters): ");
  double diameter_of_bar = double.parse(stdin.readLineSync()!);

  print("Enter the Steel Rate (in currency per kg): ");
  double steel_rate = double.parse(stdin.readLineSync()!);

  double development_length = 0.6096;
  double bend1 = 0.1524;

  // Calculate the length of one bar
  double length_of_one_bar = vertical_length_of_ground_level +
      vertical_length_of_above_ground_level +
      development_length +
      bend1;

  double reduced_bend = 2 * 0.012;
  double length_of_the_road = length_of_one_bar - 2 * reduced_bend;

  print("Enter the Clear Cover (in meters): ");
  double clear_cover = double.parse(stdin.readLineSync()!);

  double diameter_of_strips = 0.008; // Assuming this is in meters
  double a = length_of_column - 2 * clear_cover + 2 * diameter_of_strips;
  double b = breadth_of_column - 2 * clear_cover + 2 * diameter_of_strips;

  double hook_length = 2 * (10 * diameter_of_strips);
  double bend = 3 * (2 * diameter_of_strips);
  double strip_length1 = a + b;
  double strip_length2 = 2 * strip_length1;
  double actual_strip_length3 = strip_length2 + hook_length - bend;

  double spacing = 0.04; // Spacing between strips

  // Convert diameter of bar from millimeters to meters
  double diameter_of_bar_in_meters = diameter_of_bar * 0.001;

  // Calculate total number of strips
  int total_strips_int = (length_of_one_bar ~/ spacing);
  double total_strips = total_strips_int.toDouble();
  double total_strips1=total_strips+1;

  // Calculate the total length of steel required
  double result_in_meter = length_of_the_road + total_strips * actual_strip_length3;

  // Calculate cross-sectional area of the bar
  double radius = diameter_of_bar_in_meters / 2;
  double cross_sectional_area = pi * pow(radius, 2); // Area = π * r^2

  // Calculate the total mass of steel required
  double total_mass = result_in_meter * cross_sectional_area * 7850; // Density of steel in kg/m³

  // Output results
  print("Length of one bar (m) --> $length_of_one_bar");
  print("Length of the road (m) --> $length_of_the_road");
  print("Strip length (m) --> $actual_strip_length3");
  print("Total number of strips --> $total_strips");
  print("Length of one strip (m) --> $actual_strip_length3");
  print("Steel Rate (currency/kg) --> $steel_rate");
  print("Steel (in meters) required --> $result_in_meter");
  print("Total steel required (in kg) --> ${total_mass.toStringAsFixed(2)}");
  print("Total Estimated Cost --> ${steel_rate * total_mass}");
}
