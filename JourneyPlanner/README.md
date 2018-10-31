
## JourneyPlanner

The aim of this project is to expand on the open source project OpenTripPlanner(OTP). 
Using the existing source, the team will use passenger preferences to create more optimized journeys.

Set up.
1. Download the initial Portland test data and store in a folder(my gtfs and osm.pbf are located at 'W:\otp\portland'). TODO: Change to Melbourne test data. 
2. Clone the Github repository using git, or a git application such as github native or sourcetree. Look online if you're unsure how to do this
3. Download and set up a Java IDE such as Eclipse or IntelliJ. Use whatever you're used too, I(aka Dom) have used the 64bit Eclipse Oxygen 4.7 Java EE version.
4. Import cloned repository into your IDE as a maven project.
5. Depending on the IDE used, the maven project will need to download the dependencies. For example in Eclipse, right click the project, select maven, then update project. 
	This may automatically happen when initially importing the project. Downloading all the dependencies may take some time.
6. Once maven is has finished, we can build. The build configuration must be configured. Create a new Java Application build configuration.
7. Enter the main class org.opentripplanner.standalone.OTPMain
8. As an initial test, use the VM argument -Xmx2G and the program agruments --build 'data directory' --inMemory. Replace 'data directory' with the directory of where your gtfs and osm.pbf data is located(eg. W:\otp\portland)
	- The VM argument -Xmx specifies the amount of memory required to run OTP. It will change if we use bigger data sets in the future. For example, if we need 4 gigabyte memory, enter -Xmx4G as the vm argument
	- The program arguments tell OTP what configuration we want to run. To see all the possible program arguments, enter --help as the argument and run the project.


## OpenTripPlanner.

OpenTripPlanner (OTP) is an open source multi-modal trip planner. It depends on open data in open standard file formats (GTFS and OpenStreetMap), and includes a REST API for journey planning as well as a map-based Javascript client. OpenTripPlanner can also create travel time contour visualizations and compute accessibility indicators for planning and research applications. For more information, see the project website: http://opentripplanner.org

The main Java server code is in `src/main/`. OTP also includes a Javascript client based on the Leaflet mapping library in `src/client/`. The Maven build produces a JAR file at `target/otp-VERSION.jar` containing all necessary code and dependencies to run OpenTripPlanner.

Additional information and instructions are available in the [main documentation](http://opentripplanner.readthedocs.org/en/latest/), including a 
[quick introduction](http://opentripplanner.readthedocs.org/en/latest/Basic-Usage/).

