import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../index.dart';
import '../../res/widgets/indicator_animation/index.dart';
import 'widget_home/index.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController controller = PageController(viewportFraction: 0.877);
  late ScrollController _scrollController;
  Widget appBarWidget = const HeaderHomeView();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >= 65) {
      setState(() {
        appBarWidget = AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: Container(
            color: const Color(0xFFF3F3F3),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 55.7,
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xFF757575),
                            ),
                            hintText: 'Search for services',
                            hintStyle: const TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const ContainerIcons(
                    color: Colors.white,
                    icon: IconAssets.billImage,
                    isSvg: true,
                  ),
                ],
              ),
            ),
          ),
        );
      });
    } else {
      setState(() {
        appBarWidget = const AnimatedSwitcher(
            duration: Duration(milliseconds: 250), child: HeaderHomeView());
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // appBarWidget,
                    const SizedBox(
                      height: 20,
                    ),
                    SearchTextFiled(),
                    const SizedBox(
                      height: 16,
                    ),
                    CarouselSlider(
                      controller: controller,
                      slidersPath: [
                        'https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80',
                        'https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80',
                        'https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80',
                        'https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80',
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: ExpandingIndicator(
                        controller: controller,
                        count: 4,
                        effect: const ExpandingDotsEffect(
                            dotHeight: 6, dotWidth: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Categories ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CategoriesSection(),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Top Freelancers',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('explore >>',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFf757575))),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TopFreelancers(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Trending Services',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Wrap(
                          spacing: 22,
                          children: List<Widget>.generate(
                              3,
                              (int index) => Stack(
                                    children: <Widget>[
                                      Container(
                                        width: 225,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  ImageAssets.hearImageTest),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        width: 225,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 0.2)),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 125, left: 15),
                                        child: Text(
                                          'Hair services for men',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 190,
                    )
                  ],
                ),
              ),
            ),
            appBarWidget,
          ],
        ),
      ),
    );
  }
}

class TopFreelancers extends StatelessWidget {
  const TopFreelancers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 231,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: List<Widget>.generate(
                3,
                (int index) => Padding(
                      padding: const EdgeInsetsDirectional.only(
                          end: 22),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Container(
                            width: 140,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(25),
                                color: Colors.white
                                // Color(0xFFF3F3F3)
                                ),
                          ),
                          Positioned(
                              bottom: 125,
                              left: 15,
                              right: 15,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20),
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 4),
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: const ClipOval(
                                    child: Image(
                                        image: AssetImage(
                                            ImageAssets
                                                .categoriesImageTest),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              )),
                          Positioned(
                              top: 40,
                              child: SizedBox(
                                width: 140,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                      children: <Widget>[
                                        const Text(
                                            'Jack Harlow'),
                                        SvgPicture.asset(
                                            ImageAssets
                                                .documented),
                                      ],
                                    ),
                                    const Text('Electrician'),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          size: 16,
                                          color:
                                              Color(0xFFF5C443),
                                        ),
                                        Text('4.5')
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton
                                          .styleFrom(
                                        backgroundColor:
                                            const Color(
                                                0xFF5E17EB),
                                      ),
                                      child: const Text(
                                        'view profile',
                                        style: TextStyle(
                                            color:
                                                Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}

