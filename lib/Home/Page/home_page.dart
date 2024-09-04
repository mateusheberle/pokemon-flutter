import 'package:ebac_flutter/Common/Model/arguments.dart';
import 'package:ebac_flutter/Common/Model/pokemon.dart';
import 'package:ebac_flutter/Home/Controller/home_controller.dart';
import 'package:ebac_flutter/Home/Controller/home_page_repository.dart';
import 'package:ebac_flutter/Home/Widgets/catalog_list.dart';
import 'package:ebac_flutter/Home/Widgets/custom_appbar.dart';
import 'package:ebac_flutter/Home/Widgets/custom_refresh.dart';
import 'package:ebac_flutter/Home/Widgets/recently_added_implementation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

// Initial Page
class _HomePageState extends State<HomePage> {
  late HomePageController _homePageController;
  late HomePageRepository _homePageRepository;

  @override
  void initState() {
    super.initState();

    final client = Client();
    final repository = HomePageRepository(client);

    _homePageController = HomePageController(
      name: widget.title,
      ihomePageRepository: repository,
    );

    _homePageRepository = repository;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homePageController.getPokemon();
    });
  }

  @override
  void dispose() {
    // _homePageController.homeSearchController.dispose();
    _homePageController.detailSearchController.dispose();
    _homePageController.isLoading.dispose();
    _homePageController.isRefreshCustomOn.dispose();
    _homePageController.typeList.dispose();
    _homePageController.fullCatalog.dispose();
    _homePageController.customCarouselSliders.dispose();
    _homePageController.recentlyAdded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        arguments: Arguments(
          homePageController: _homePageController,
          tag: '',
          pokemon: Pokemon(id: 0, name: ''),
        ),
        globalKey: GlobalKey(),
        isDetailPage: false,
      ),
      body: ValueListenableBuilder(
        valueListenable: _homePageController.recentlyAdded,
        builder: (context, value, child) => Stack(
          alignment: AlignmentDirectional.center,
          children: [
            RecentlyAddedImplementation(
              homePageController: _homePageController,
            ),
            CatalogList(
              homePageController: _homePageController,
            ),
            CustomRefresh(
              homePageController: _homePageController,
              repository: _homePageRepository,
            ),
          ],
        ),
      ),
    );
  }
}
