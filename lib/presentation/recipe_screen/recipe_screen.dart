import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';
import 'package:flutter_project_orm_janggo/data/user_information/user_information.dart';
import 'package:flutter_project_orm_janggo/presentation/ads/google_ads_Ids.dart';
import 'package:flutter_project_orm_janggo/presentation/recipe_screen/recipe_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({
    super.key,
    required this.ingredients,
  });

  final String ingredients;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  // 현재 페이지의 index 추적
  final PageController _pageController = PageController();

  // Add _interstitialAd
  InterstitialAd? _interstitialAd;

  // 현재 페이지의 index
  int _currentPage = 0;

  // initialize google mobile ad sdk
  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  // Implement _loadInterstitialAd()
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: GoogleAdsIds.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          print('------------ad------------');
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {},
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initGoogleMobileAds();
    _loadInterstitialAd();
    final ingredients = widget.ingredients;
    context.read<RecipeViewModel>().getRecipe(ingredients);
  }

  // add for ad
  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeViewModel>();
    final state = viewModel.state;

    _interstitialAd?.show();

    if (state.recipe.isNotEmpty) {
      viewModel.getPicture(state.recipe);
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        // 커스텀 레이아웃을 사용하여 텍스트를 중앙에 위치
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
          children: [
            Spacer(), // 왼쪽에서 중앙으로 텍스트 이동
            Text(
              state.recipe.isNotEmpty ? '${_currentPage + 1} / ${state.recipe.length}' : '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Spacer(), // 오른쪽 아이콘과 간격 유지
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/main/recipe-history');
            },
            icon: const Icon(Icons.face),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: state.recipe.isEmpty
            ? Center(
                child: Container(
                  width: 300,
                  height: 150,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/book.gif',
                        fit: BoxFit.fill,
                      ),
                      const Text(
                        'Ai가 레시피를 찾고있어요 잠시만 기다려주세요!',
                        style: TextStyle(fontFamily: 'school_font', fontSize: 12),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 4.0,
                      child: Center(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.recipe.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width / 3 - 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: _currentPage == index ? const Color(0xfffb8c00) : Colors.grey.shade200,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        itemCount: state.recipe.length > 3 ? 3 : state.recipe.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          final currentItem = state.recipe.isNotEmpty ? state.recipe[index] : null;
                          final isLiked = index < state.isLike.length ? state.isLike[index] : false;
                          final imageUrl =
                              state.url.isNotEmpty && index < state.url.length && state.url[index] != 'empty'
                                  ? state.url[index]
                                  : '';

                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 265,
                                    width: 400,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: imageUrl.isNotEmpty
                                          ? Image.network(
                                              imageUrl,
                                              height: 265,
                                              width: 400,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              'assets/images/empty_image.png',
                                              height: 265,
                                              width: 400,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Stack(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.amber[50],
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            state.recipe[index],
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'hand_font',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          right: 16,
                                          top: 16,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                final currentPageIndex = _currentPage.clamp(0, state.isLike.length - 1);
                                                final isLiked = state.isLike[currentPageIndex];
                                                viewModel.toggleLike(currentPageIndex, !isLiked);
                                                if (state.url.isNotEmpty && state.url[currentPageIndex] != "empty") {
                                                  // 이미지가 있을 때
                                                  if (!isLiked) {
                                                    viewModel.addLikeItem(LikeItem(
                                                        recipe: currentItem!,
                                                        id: state.id[currentPageIndex].toString(),
                                                        imageUrl: state.url[currentPageIndex],
                                                        isLiked: true,
                                                        foodName: state.foodName,
                                                        time: DateTime.now()));
                                                  } else {
                                                    viewModel.removeLikeItem(LikeItem(
                                                        recipe: currentItem!,
                                                        id: state.id[currentPageIndex].toString(),
                                                        imageUrl: state.url[currentPageIndex],
                                                        isLiked: false,
                                                        foodName: state.foodName,
                                                        time: DateTime.now()));
                                                  }
                                                } else {
                                                  // 이미지가 없을 때
                                                  if (!isLiked) {
                                                    viewModel.addLikeItem(LikeItem(
                                                        recipe: currentItem!,
                                                        id: state.id[currentPageIndex].toString(),
                                                        imageUrl: '',
                                                        isLiked: true,
                                                        foodName: state.foodName,
                                                        time: DateTime.now()));
                                                  } else {
                                                    viewModel.removeLikeItem(LikeItem(
                                                        recipe: currentItem!,
                                                        id: state.id[currentPageIndex].toString(),
                                                        imageUrl: '',
                                                        isLiked: false,
                                                        foodName: state.foodName,
                                                        time: DateTime.now()));
                                                  }
                                                }
                                              });
                                            },
                                            icon: Icon(
                                              state.isLike[_currentPage] ? Icons.favorite : Icons.favorite_border,
                                              color: Colors.red,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

}
