import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:xvpn/feature/presentation/pages/main_page.dart';
import 'package:xvpn/utils/constants/colors.dart';

class OnboardingPage extends StatelessWidget {
  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Ищешь хороший VPN?",
      body:
          "А я ищу хорошую работу\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa.",
      image: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: ClipRRect(
            // Добавьте ClipRRect для обрезки картинки по скруглению
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/banners/banner_onboarding.png",
              height: 200,
              width: double.infinity, // Занимает всю ширину
              fit: BoxFit.cover, // Растягиваем картинку
            ),
          ),
        ),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 16),
        imagePadding: EdgeInsets.all(16),
      ),
    ),
    PageViewModel(
      title: "Идеальное исполнение?",
      body: "Для меня это - не проблема. Опыт разработки более 5 лет. Ищу работу, где смогу раскрыть свой потенциал и отточить навыки. Не бывает невыполнимых задач. Любая задача - вопрос времени. Всё, что не умею - быстро осваиваю. Всё что умею - довожу до идеала.",
      image: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: ClipRRect(
            // Добавьте ClipRRect для обрезки картинки по скруглению
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/banners/banner_onboarding.png",
              height: 200,
              width: double.infinity, // Занимает всю ширину
              fit: BoxFit.cover, // Растягиваем картинку
            ),
          ),
        ),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 16),
        imagePadding: EdgeInsets.all(16),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      },
      onSkip: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      },
      showSkipButton: true,
      skip: Text(
        "Пропустить",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
      ),
      next: Icon(
        Icons.arrow_forward,
        color: Theme.of(context).primaryColor,
      ),
      done: Text("Начать", style: Theme.of(context).textTheme.bodyMedium),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).primaryColor,
        color: XColors.primaryTextColor,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      // Анимации
      animationDuration: 500,
      globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
