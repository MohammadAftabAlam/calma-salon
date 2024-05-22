class SalonExperts {
  SalonExperts(this.name, this.imagePath, this.expertise,
      this.yearOfExperience, this.salonLocation, this.rating);

  final int yearOfExperience;
  final double rating;
  final String name, imagePath, salonLocation;
  final List<String> expertise;
}
