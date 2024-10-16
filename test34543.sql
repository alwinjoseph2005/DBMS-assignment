-- Create WeatherStation Table
CREATE TABLE WeatherStation (
    Station_ID INT PRIMARY KEY,
    Station_Name VARCHAR(100),
    Location VARCHAR(100),
    Region VARCHAR(50),
    Latitude FLOAT,
    Longitude FLOAT,
    Established_Date DATE,
    Elevation FLOAT,
    Contact_Person VARCHAR(100),
    Contact_Number VARCHAR(15)
);

-- Create Meteorologist Table
CREATE TABLE Meteorologist (
    Meteorologist_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Qualification VARCHAR(100),
    Experience_Years INT,
    Specialization VARCHAR(100),
    Email VARCHAR(100),
    Phone_Number VARCHAR(15),
    Station_ID INT,
    FOREIGN KEY (Station_ID) REFERENCES WeatherStation(Station_ID)
);

-- Create WeatherReport Table
CREATE TABLE WeatherReport (
    Report_ID INT PRIMARY KEY,
    Date DATE,
    Temperature_Max FLOAT,
    Temperature_Min FLOAT,
    Humidity INT,
    Rainfall FLOAT,
    Wind_Speed FLOAT,
    Air_Pressure FLOAT,
    Weather_Description VARCHAR(255),
    Station_ID INT,
    Meteorologist_ID INT,
    FOREIGN KEY (Station_ID) REFERENCES WeatherStation(Station_ID),
    FOREIGN KEY (Meteorologist_ID) REFERENCES Meteorologist(Meteorologist_ID)
);

-- Create Forecast Table
CREATE TABLE Forecast (
    Forecast_ID INT PRIMARY KEY,
    Date DATE,
    Predicted_Temperature_Max FLOAT,
    Predicted_Temperature_Min FLOAT,
    Predicted_Humidity INT,
    Predicted_Rainfall FLOAT,
    Predicted_Wind_Speed FLOAT,
    Predicted_Weather_Description VARCHAR(255),
    Station_ID INT,
    FOREIGN KEY (Station_ID) REFERENCES WeatherStation(Station_ID)
);

-- Create DisasterWarning Table
CREATE TABLE DisasterWarning (
    Warning_ID INT PRIMARY KEY,
    Date_Issued DATE,
    Type VARCHAR(100), -- e.g., Cyclone, Flood, Heatwave
    Severity VARCHAR(50), -- e.g., Moderate, High, Severe
    Affected_Region VARCHAR(100),
    Start_Date DATE,
    End_Date DATE,
    Description TEXT,
    Station_ID INT,
    FOREIGN KEY (Station_ID) REFERENCES WeatherStation(Station_ID)
);

-- Create Equipment Table
CREATE TABLE Equipment (
    Equipment_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50), -- e.g., Temperature Sensor, Rain Gauge, Anemometer
    Installation_Date DATE,
    Status VARCHAR(50), -- e.g., Operational, Under Maintenance
    Station_ID INT,
    FOREIGN KEY (Station_ID) REFERENCES WeatherStation(Station_ID)
);

-- Create ClimateData Table
CREATE TABLE ClimateData (
    Climate_ID INT PRIMARY KEY,
    Year INT,
    Average_Temperature FLOAT,
    Average_Humidity FLOAT,
    Average_Rainfall FLOAT,
    Station_ID INT,
    FOREIGN KEY (Station_ID) REFERENCES WeatherStation(Station_ID)
);
