# Onramp iOS Take-Home Project 

## A description of the overall iOS application
* A weather app that allows the user to check current weather
* User can choose to either search a city or get current location weather data
* User can save cities and use the tab bar to segue between searching and the current weather of saved cities

## A high level architectural overview of your iOS application. e.g. names, relationships and purposes of all UIViewControllers and UIViews

* WeatherModel.swift: The model for the app. Contains the relevant raw data from the OpenWeatherMap API calls. Utilizes the Codable protocol so more fields can be added.
* WeatherViewModel.swift: The View Model created from the WeatherModel. Extracts the temperature and id from the WeatherModel. Has calculated properties to convert temperature to a String. 
* Explanations for and descriptions of the design patterns you leveraged

