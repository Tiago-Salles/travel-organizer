import 'package:flutter/cupertino.dart';
import 'package:travel_organizer/app/core/modules/app_module.dart';
import 'package:travel_organizer/app/domain/domains/home_domain.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeDomain homeDomain;

  @override
  void initState() {
    homeDomain = AppModule.homeDomain;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
