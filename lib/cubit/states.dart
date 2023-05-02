abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavBarState extends NewsStates{}

//Business
class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessDataSuccessState extends NewsStates{}

class NewsGetBusinessDataErrorState extends NewsStates
{
  final String error;

  NewsGetBusinessDataErrorState(this.error);
}

//Sports
class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetSportsDataSuccessState extends NewsStates{}

class NewsGetSportsDataErrorState extends NewsStates
{
  final String error;

  NewsGetSportsDataErrorState(this.error);
}

//Science
class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetScienceDataSuccessState extends NewsStates{}

class NewsGetScienceDataErrorState extends NewsStates
{
  final String error;

  NewsGetScienceDataErrorState(this.error);
}

//Search
class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSearchDataSuccessState extends NewsStates{}

class NewsGetSearchDataErrorState extends NewsStates
{
  final String error;

  NewsGetSearchDataErrorState(this.error);
}

class AppChangeMode extends NewsStates{}


