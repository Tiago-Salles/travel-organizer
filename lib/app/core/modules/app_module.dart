import 'package:travel_organizer/app/core/services/travel_service.dart';
import 'package:travel_organizer/app/domain/domains/home_domain.dart';

class AppModule {
  static final HomeDomain homeDomain = HomeDomain(travelService: travelService);
  static final TravelService travelService = TravelService();
}
