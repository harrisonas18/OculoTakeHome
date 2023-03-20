# OculoTakeHome

### Description
Implements the Burn Rate view and Add goals view. 100% Native Swift with no dependencies.

## Oculo Health Take Home Project

### How to run
Clone, Build & Run

OR

Download Zip, Extract, Build, & Run

### UI Design
I used SwiftUI to create the UI. Using SwiftUI with previews makes UI iteration much faster. In addition, coupling SwiftUI with an MVVM architecture produces cleaner and easier-to-read code. I tried to make all of the views dynamic and not static so they could immediately be put to use with dynamic data. Most of the views have accompanying models and view models to build themselves out. A cool touch I added was to animate the burn rate graphic to make it more dynamic and make it seem like it was a data point that could change. 

### Trade Offs

Burn Rate View -

When designing the Burn Rate View I made some modifications to the charts being displayed in the factors section. In order to make the charts dynamic and flexible for future use I implemented a slightly different design than the mockups. These modified charts are not just static and make use of mock data stored in the Data.swift file. Because they use the Charts API the actual result is slighlty different than the mockup. These charts can be modified further to reflect the actual design but because of time constraints I felt the current result was sufficient. 

Another part of the mockup that I ommitted in the final chart design was the label for the caffeine chart. I did this because it would've taken significantly more time to modify the chart data and view in order to get the label to display properly which I felt was outside the scope of the exercise.

The last part of the burn rate view that I made a trade off in was the burn graphic. Currently, the burn graphic data at the top of the burn summary is static. I didn't make this view dynamic because I didn't have the designs to implement what the other states of the burn graphic could be so it didn't really make sense to implement something that could change in the future. 

Add Goals View -

The next design trade off I made was changing the size of the "Add Goals" popover. Because I used SwiftUI to build this project I discovered that the popover does not self size to the content size on mobile devices. The popover covers the full screen. Because of this I modified the arrangement of contents for the popover to resemble the mockup as closely as possible. A solution could of been made with UIKit but I did not have time to pursue that solution so I stuck with what I had.

