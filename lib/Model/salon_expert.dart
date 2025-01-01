class SalonExperts {
  const SalonExperts({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.expertise,
    required this.yearOfExperience,
    required this.workingInSalon,
    required this.rating
});

  final int yearOfExperience;
  final double rating;
  final String id;
  final String name;
  final String imagePath;
  final String workingInSalon;
  final List<String> expertise;
}
