
class UpcomingAppointment {
  const UpcomingAppointment(
      this.name, this.location, this.date, this.time, this.salonImage, this.bookingId, this.isFav);
  final String name, location, date, time, bookingId, salonImage;
  final bool isFav;
}
