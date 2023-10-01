import 'package:flutter/material.dart';

import '../../features/do_somthing/presentation/pages/home/home.dart';



class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const Home());

      // case '/ArticleDetails':
      //   return _materialRoute(ArticleDetailsView(article: settings.arguments as ArticleEntity));

      // case '/SavedArticles':
      //   return _materialRoute(const SavedArticles());
        
      default:
        return _materialRoute(const Home());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
