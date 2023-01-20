# NYCSchool
 
NYC Schools Challenge 

How to run: 
	.	1)  Download the zip file and unzip it.  
	.	2)  Open `NYCSchool.xcodeproj` in xcode  
	.	3)  Run project (cmd + R or Product > Run)  
 
Note: I developed the project on Xcode14 using Swift & UIKit. I tested it on both iOS15 and 16. Please let me know if you face any issues in building it. 

Focus Area: 
	1.	I have focused on Scalable, extensible architecture which handles error and exceptions gracefully. 
	2.	I have created a minimum UI which shows all the relevant information in a list view (School name, Phone and location/neighbourhood). 
	3.	When tap on any "School" card, it will open a detail pafe which shows "SAT score" information. 
 
Technical/Functional consideration and tradeoffs: 
	1.	I’m using MVVM (Model-view-viewmodel) architecture for this project. As this is a sample project, I wanted to create a simple but extensible and testable architecture. MVVM has its pro and cons but for this project, it has everything needed with capabilities for a future enhancement.  
	2.	I handle different kinds of errors (decoding, bad requests, network unavailability etc).  
	3.	I’m showing an empty screen with a message in case of an error. I wanted to build a minimal  viable product which handles all the exceptions and gives meaningful information to a user when an error occurs. That's why I decided to show error messages.  
	4.	I have built UI in SwiftUI. 
	5.	When there is an empty response, I’m showing a message on the screen. This message is same as error message. 
	6.	I have written a unit test `NetworkManagerTests` to validate the ‘valid` and ‘malformed`  json.  
	7.	Tested it on small & large screen size with landscape and portrait orientation.  
 
Future Enhancement: 
If I would have more time, I would: 
		-  Add a coordinator which would follow the coordinator pattern. It would be responsible for  navigation between screens.  
		-  This Json response is very large, I would add `pagination` and `pullToRefresh` for better user  experience.  
		-  Snapshot test for regression  
		-  Instead of adding “hardcoded string” for labels, I could create a localized object which would have  all strings saved.  
		-  UI enhancement for School list. 
		-  Will add caching layer to cache information for faster load.
		-  `Search feature` for School list as it would be super helpful to user 
  
		 3rd Party Library:  None 
   
		 How much time did I spent:  Around 3-4 hours throughout week in chunks  
		
ScreenShots:
---

![Simulator Screen Shot - iPhone 14 Pro - 2023-01-20 at 00 05 45](https://user-images.githubusercontent.com/2319181/213656159-09104b79-7690-4a07-b88c-f70b7129009b.png)
![Simulator Screen Shot - iPhone 14 Pro - 2023-01-20 at 00 05 53](https://user-images.githubusercontent.com/2319181/213656162-44f45c47-fa28-492d-a645-c69553b0445e.png)
![Simulator Screen Shot - iPhone 14 Pro - 2023-01-20 at 00 06 12](https://user-images.githubusercontent.com/2319181/213656167-dc5351b5-8252-4eb2-81ef-39d0a978d94d.png)
