# FazendaMonitora
[This app is still in development]

[This app is in PT-BR. Localization is still being developed]

Monitor each crop on your farm. Get alerts about crops that need your attention. Have a better and bigger production. 
![](https://mattcbr.github.io/imgs/Projects/Apps/Farm.png)

## App Description

This app was developed as part of the [MBLabs](http://mblabs.com.br/)'s selection proccess. It consists of an app that receives updated information about crops in a farm every 5 minutes and should warn the user if something is wrong with a crop, showing the user what is wrong and in which crop. Here is a description of each screen in this app:

* "Overview" Screen:

This screen shows an overview of all the crops and its status. Its composed of an image view that shows in general what is the status of your crops (Can be good, attention and critical) and three buttons. This buttons are responsible of telling you how many crops are in each state, and when this buttons are tapped they take you to the "Details" screen.

* "Details" Screen:

This screen shows a detailed list of each crop, ordered by status(From critical to good). Each cell shows the following items for each crop: icon, name, status, umidity and temperature. Selecting a cell will lead you to the "crop details" screen, which will show you more details about that specific crop.

* "Configurations" Screen:

This screen is not developed yet. It will have account and app configurations.

* "Crop Details" Screen:

This screen shows more details about the selected crop. It shows name, status, umidity and temperature of the crop. It also has a MapView that shows a satellite view of the location of that crop, in order to facilitate location of each crop.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

To run this app you will need:
* [Xcode](https://developer.apple.com/xcode/)

You can download the source code manually using GitHub's interface or using the terminal:

```
git clone https://github.com/Mattcbr/FazendaMonitora.git
```

## Running the tests

Tests were not developed yet for this app.

## Built With

* [Swift](https://developer.apple.com/swift/) - The programming language used
* [Cocoapods](https://cocoapods.org/) - Dependency Management
* [AlamoFire](https://github.com/Alamofire/Alamofire) - Used to make API requests

## Authors

* **Matheus Castelo**
  - [Website](https://mattcbr.github.io/)
  - [Github](https://github.com/Mattcbr)
  - [LinkedIn](https://www.linkedin.com/in/matheuscastelo/)
