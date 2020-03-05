# Onramp iOS Take-Home Project 

## A description of the overall iOS application
* A weather app that allows the user to check current weather
* User can choose to either search a city or get current location weather data
* User can save cities and use the tab bar to segue between searching and the current weather of saved cities

## A high level architectural overview of your iOS application. e.g. names, relationships and purposes of all UIViewControllers and UIViews
* Tab Bar Controller: Allows user to segue between SearchViewController and SavedWeatherViewController
    * Tab Bar: The Tab Bar conttaining the Tab Items to switch between the two main views of the app
* Search View Controller: The initial view for the app. When first loaded, it requests the user's permission for location.
    * Location Button: On click, requests user's location and uses the coordinate data to make an API call to get current weather
    * Search Text Field: User can search a city's name instead of using location data. Can submit city by either using the return button, or search button.
    * Search Button: Triggers an API call with the input given in the Search Text Field.
    * Weather Condition Image: Based on the condition ID returned by the API call, changes to an image to represent the current weather (sunny, cloudy, rainy with clouds etc)
    * Temperature Label: The # in degrees of the current location.
    * Save Button: Saves the last city searched to UserDefaults to view in the SavedViewController
* Saved View Controller: Uses a Table View Controller to display a list of the current weather of the saved cities
    * Weather Cell - The prototype cell that populates the table. Has a title, subtitle, and an image view that is set on view load
    

## Explanations for and descriptions of the design patterns you leveraged

### Delegate Design Pattern
Weather View Controllers are both delegates of the WeatherAPIManager protocol. This separates the logic for updating the view from the logic that is responsible for making API calls, parsing JSON, and packing the JSON as a View Model. The file responsible for API calls should not also be responsible for updating the view, that's when delegattion comes in handy for the delegates to handle what happens.

### Observer Design Pattern
This pattern was used because I needed a way for the table view controller to know it needed to update its cells when the user saved a location. The Saved Weather Controller would observe to see if there was a change to the UserDefault with key "Cities" and the Search View Controller would post that notifcation whenever the save button was pressed.

### MVVM Design Pattern
The MVVM design pattern was utilized to separate concerns clearly. It is especially useful to separate logic from the Model and Controller. In the typical MVC pattern, developers can find themselves including a lot of logic in their Model file to prepare it for the View. The MVVM tries to solve this issue by creating an intermediary between the Model and View. The View Model is a model made for the view and is responsible for speaking to the view.

Each folder is strict on what it does. The View folder contains the Views which display the View Model and talks to the View Model to update the View. The View Model serves as an intermediary between the Model and View. 

The View Model is created from the parsed JSON contained in the Model. The View Model is also responsible for making API calls and triggering updates in the View.

The Model folder contains a file which is a simple struct that implements the Codable protocol containing the relevant JSON from the weather API call.

The Controller folder contains the logic to interact with both the Search View Controller and Saved Weather View Controller. Here is where the views will ask the API manager to make a call and update their own elements accordingly.

If the MVVM design pattern was not used, a lot of logic in the View Model folder such as API calls and preparing data for the view would be present in the Model folder. That might be ok for a smaller project like this, but makes code hard to maintain as projects grow bigger.

## Going over each requirement

### Use of at least 3 UIViewControllers
1. Tab Bar Controller 
2. Search View Controller
3. Saved Weather View Controller


### Use of at least one UIView
1. Super view in Search View Controller
2. Empty view used within the vertical stack view for positioning

### Usage of the MVVM Pattern
See section where I explained how and why the MVVM design pattern was used

### Use of a REST API
The OpenWeatherMap (insert link here) API was used. You can find calls to this API in `View Model/WeatherAPIManager.swift` in the `performRequest()` function. The response was decoded/encoded with the model found in `Model/WeatherModel.swift`

### Usage of at least 5 UIView/UIControl subclasses
1. Label in Search View 
2. Button in Search View
3. Image View in Search Scene
4. Tab Bar in all views
5. Tab Bar items in all Views
6. TableView in Saved Weather View


### The usage of data persistence 
User's last location search is saved as well as any locations the user has chosen to save. These locations are stored in an array of Strings. When the user switches to the table view, the cells are populated with API calls using that array of strings as input for each API call.

## Screenshots of each View and descriptions of the overall user flow




