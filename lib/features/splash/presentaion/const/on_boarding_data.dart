class OnBoardingData {
  final String lottiePath;
  final String title;
  final String subtitle;

  const OnBoardingData(this.lottiePath, this.title, this.subtitle);
}

const List<OnBoardingData> onBoardingItems = [
  OnBoardingData('assets/lottie/on_boarding1.json', 'Plan your trips',
      'Book one of your unique hotel to \n escape the ordinary'),
  OnBoardingData('assets/lottie/on_boarding2.json', 'Find best deals',
      'Find deals for any season from cosy country homes to city flats '),
  OnBoardingData('assets/lottie/on_boarding3.json', 'Best travelling all time',
      'Find best deals Find deals for any season from cosy country homes to city flats'),
];
