# Onramp iOS Take-Home Project 

## Overview 🍎

Congratulations for making it this far in the interview process for the Pandora Demo Tape Apprenticeship at Onramp!

This project seeks to better inform the Onramp team of your experience with Swift programming and iOS development as well as prepare you for your interview at Pandora.

You will have seven days to complete this project. We expect those who have a moderate level of iOS development experience to spend between 24 and 32 hours to design, implement, document, and submit the project to us. Depending on your level, it may take more or less time, so please plan accordingly.

**The project is due on Friday, March 6 at 9:00am PST/12:00pm EST.**

### Project Summary:
* Total time available to complete: 7 days
* Due date/time: Friday, March 6 at 9:00am PST/12:00pm EST
* Expected development time to complete: 24 - 32 hours 
* Required stack/tools: a Mac computer using Swift and Xcode

## App Requirements and Details 🔎

For this project, we want you to build an iOS application that is one of the following: 
* A newsfeed app
* A weather app
* A photo gallery
* An audio/video playback app

Consider which of these projects you’d be most excited to work on, **not** what you think your interviewers or Onramp would like to see. 

**Scope your features and functionality to what you can reasonably accomplish by the due date. Your application must include the following architectural requirements:** 

* Use of at least 3 [UIViewControllers](https://developer.apple.com/documentation/uikit/uiviewcontroller).
* Use of at least one [UIView](https://developer.apple.com/documentation/uikit/uiview). You can subclass UIView and add subviews to that class.
* The usage of the [MVVM](https://www.raywenderlich.com/34-design-patterns-by-tutorials-mvvm) architectural pattern.
* Use of a [REST API](https://medium.com/@arteko/the-best-way-to-use-rest-apis-in-swift-95e10696c980). We suggest using [Codable](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types) for handling JSON.
* Usage of at least 5 UIView/UIControl subclasses (UITableViews, UISegmentedControl, etc).
* The usage of data persistence - UserDefaults, NSKeyedArchiver, or what makes most sense to you. 

##### NOTE: you will need to detail where and how your iOS App meets these requirements in your repository's README file when you submit your project.


### A Note on Researching and Plagiarism

You are actively encouraged to research the web, books, videos, or tutorials for this project. That said, we expect all code that is submitted to be your own (e.g. this project should NOT be completed with another person). That means that we expect each candidate to refrain from copying and/or pasting code into the project. If we find copied code in your project, we will have to disqualify you. Web and video resources are available at the end of this document.

## What we're looking for 🚀

We will evaluate your project by assessing the overall strength and quality of the following five factors:

### UI Design

iOS users expect your application to look and behave in a way that's consistently intuitive. Your iOS application should adhere to [Apple’s Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/overview/themes/) (HIG). Be thoughtful of the UI elements you use, and refer to the HIG for examples of best practices. 

### Architecture Pattern 

An architecture pattern enables you to define a guide for how a piece of software should function, such that it can be scalable, maintainable, and testable. Common patterns for iOS applications include [MVC](https://www.raywenderlich.com/1000705-model-view-controller-mvc-in-ios-a-modern-approach) (Model-View-Controller), Viper, and [MVVM](https://www.raywenderlich.com/34-design-patterns-by-tutorials-mvvm) (Model-View-ViewModel). Keep in mind the concept of Separation of Concerns (youtube video discussing that here). **Note that it is required that you leverage the MVVM pattern within your iOS app.**

### Core iOS Components

Make sure to use version control with your app using a Github repository. 
A large part of iOS development consists of consuming JSON data to display on the screen. Leverage an API of your choice to fetch data for use within your app. Make sure to meet all app requirements, as laid out above. You can choose your preference of either Storyboard/Interface Builder or programmatic UI.

### iOS Development Best Practices

It's important to subscribe to a set of best practices when designing and implementing an iOS app. Be mindful of these widely accepted principles:

* [DRY](https://code.tutsplus.com/tutorials/3-key-software-principles-you-must-understand--net-25161) (don't repeat yourself). Also view this [Wikipedia Article](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).
* Maintain a [separation of concerns](https://youtu.be/hIaPdjS5GNo?t=163) within your iOS components. Adhering to MVVM should naturally separate the various components of your app.
* Specify good [project structure](https://www.swiftbysundell.com/articles/structuring-swift-code/).
* Using these principles will result in a high quality user experience while efficiently utilizing phone hardware resources and ensuring other developers can easily navigate through your code.

### Application Description

Each project submission must include a README file providing an overview of the iOS application and details the app's overall MVVM architecture as well as your design decisions. Screenshots of the iOS app taken from the Xcode simulator or your testing device are also required. This task assesses the critical competency of communicating and documenting technical concepts. See details in the submission information section below.

# What we are NOT Evaluating ❌

## Testing

Testing frameworks and strategies are intentionally NOT assessed because we want you to dedicate your time to building a functional application. We do realize that UI and iOS component testing are critical practices of iOS Development, but this project prioritizes a focus on surfacing Swift/iOS development proficiency.

## Feature Depth

You won’t be earning extra points for having a bunch of features. Focus on creating a clean, simple application that addresses all of the requirements and is documented properly for submission.

# Submission Information 🎇

This repository will be your starting point. Please download (not clone or fork) this Github repository and upload changes to a newly created **public** repository. Once the iOS application has been completed, you'll be submitting a link to the new repository you created. Prior to submitting your project, you should update the README file to provide the following information:

* A description of the overall iOS application
* A high level architectural overview of your iOS application. e.g. names, relationships and purposes of all UIViewControllers and UIViews
* Explanations for and descriptions of the design patterns you leveraged
* [Screenshots](https://stackoverflow.com/questions/7092613/take-screenshots-in-the-ios-simulator) of each View and descriptions of the overall user flow

## Submission Deadline + Process

You must submit your project by **9:00am PST/12:00pm EST on Friday, March 6** using this [form](https://docs.google.com/forms/d/e/1FAIpQLSfVu3xnF7UsgZIItpW36ggH9ASrhfozUl3Jo2lwse3tP4bAxg/viewform). 

Once you’ve submitted your project, you are expected to stop working on it. Any commits that occur after submission or the deadline will not be reviewed. 

## Additional Resources
* MVVM [Swift: How to Migrate MVC to MVVM](https://www.youtube.com/watch?v=n06RE9A_8Ks), [Different Flavors of view models in Swift by Sundell](https://www.swiftbysundell.com/articles/different-flavors-of-view-models-in-swift/), [AppCoda: Introduction to MVVM](https://www.appcoda.com/mvvm-vs-mvc/), [objc.io: Introduction to MVVM](https://www.appcoda.com/mvvm-vs-mvc/)
* [Swift Language Guide](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
* [Exhaustive list of iOS Good Practices](https://github.com/futurice/ios-good-practices) 
* [Hacking With Swift blog](https://www.hackingwithswift.com/)
* [Ray Wenderlich blog](https://www.raywenderlich.com/)
* [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/overview/themes/)
* [Separation of Concerns](https://www.youtube.com/watch?v=VtF6aebWe58&feature=youtu.be)
* [SwiftLee blog](https://www.avanderlee.com/)
* [Data Persistence](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/PersistData.html)
* [Apple Developer App](https://apps.apple.com/us/app/apple-developer/id640199958)
* [WWDC Videos](https://developer.apple.com/videos/)
