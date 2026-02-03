import 'package:flutter/material.dart';
import 'package:xvpn/feature/presentation/architecture/routable_page.dart';
import 'package:xvpn/utils/constants/icons.dart';

class OpenerOptionPage extends StatelessWidget {
  const OpenerOptionPage({
    super.key,
    required this.title,
    required this.page,
    this.textColor,
  });

  final String title;
  final RoutablePage page;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => RoutablePage.push(
        context,
        page,
      ),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
            ),
            XIcons.getIcon(
              name: 'arrow',
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
