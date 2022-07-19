import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_organizer/app/core/modules/app_module.dart';
import 'package:travel_organizer/app/domain/domains/home_domain.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeDomain homeDomain;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    homeDomain = AppModule.homeDomain;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const Drawer(
          backgroundColor: Color(0xAA1B182B),
        ),
        backgroundColor: const Color(0xAA1B182B),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xAA322F40),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        color: Colors.grey,
                        onPressed: () =>
                            _scaffoldKey.currentState?.openDrawer(),
                        icon: const Icon(Icons.menu),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xAA322F40),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        color: Colors.grey,
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'Descubra a\n',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: 'beleza do mundo',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: const Color(0xAA322F40),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.zero,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xAA322F40),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          suffixIcon: const Icon(
                            Icons.tune,
                            color: Colors.grey,
                          ),
                          hintText: 'Pesquise sua próxima viagem'),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(children: [
                    ActionChip(
                      onPressed: () {},
                      backgroundColor: Colors.blue,
                      label: const Text('Todos'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Chip(
                      label: Text('Recomendado'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Chip(
                      label: Text('Popular'),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 20,
                            crossAxisCount: 1,
                            childAspectRatio: 0.8),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xAA322F40),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/night-road-trip-by-car-family-travel-auto-with-bags-roof-driving-mountains-highway-with-beautiful-seaview-landscape-full-moon-summer-journey-ocean-cartoon-vector-illustration_107791-10255.jpg?",
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Cruise Resort',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      'Cruise Resort',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xAA322F40),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color.fromARGB(170, 8, 129, 113),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.network(
                                  "https://thumbs.dreamstime.com/b/seamless-cyberpunk-cityscape-silhouette-horizontal-vector-background-futuristic-night-lights-neon-purple-pink-196326928.jpg",
                                ),
                              ),
                            ),
                            const Text(
                              'Futurist Art',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
