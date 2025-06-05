import 'package:calma/Model/upcoming_appntmnt.dart';

class UpcomingAppointmentData{
  final String name, location, date, time, salonImage, bookingId;
  final bool isFav;
  UpcomingAppointmentData(this.name, this.location, this.date, this.time, this.salonImage, this.bookingId, this.isFav);

  BookServices bookServices = BookServices();
  // toggleInformation(){
  //   bookServices.bookServicesData.add(UpcomingAppointment(name, location, date, time, bookingId, salonImage, isFav));
  // }
  // var bookServicesData = [];

}


class BookServices{
 var bookServicesData = [
   UpcomingAppointment("Varsha Salon", " NFC,New Delhi", "22/05/2024", "11:25", "asset/images/ayushi_parlour.jpg", "bookingId", true),
   UpcomingAppointment("Varsha Salon", " NFC,New Delhi", "22/05/2024", "11:25", "asset/images/ayushi_parlour.jpg", "bookingId", true),
   UpcomingAppointment("Varsha Salon", " NFC,New Delhi", "22/05/2024", "11:25", "asset/images/ayushi_parlour.jpg", "bookingId", true),
 ];
}