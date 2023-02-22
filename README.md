# Weather App

Weather app on Flutter to see the forecast.

## Features

- [x] Current weather in the selected city
- [x] Hour-by-hour temperature chart
- [x] Screens: current weather, forecast screen
- [x] Weather forecast for 3 and 5 days
- [x] Monitoring Air Quality Index
- [x] Detail display: pressure, sunrise/sunset time, humidity, wind speed
- [x] Work with backend is implemented, data is sent/received from
  the https://openweathermap.org/api
- [x] Organized saving data to disk using a SQFLite
- [x] Internationalization
- [X] State-management and DI implemented using `flutter_bloc`
- [x] App icon
  added <img src="https://github.com/olndl/weather_app/blob/f/refactoring/screenshots/icon.png" width="25" />
- [X] Theme support

## Screenshots

<p float="center">
<img src="https://github.com/olndl/weather_app/blob/f/tests/screenshots/mock-0.png" width="220" height="400"/>
<img src="https://github.com/olndl/weather_app/blob/f/tests/screenshots/mock-1.png" width="220" height="400"/>
<img src="https://github.com/olndl/weather_app/blob/f/tests/screenshots/mock-2.png" width="220" height="400"/>
<img src="https://github.com/olndl/weather_app/blob/f/tests/screenshots/mock-3.png" width="220" height="400"/>
<img src="https://github.com/olndl/weather_app/blob/f/tests/screenshots/retry.png" width="220" height="400"/>

</p>

## Packages Used

- `flutter_bloc` for state management.
- `dio` to work with Http client.
- `freezed` - code generator for data-classes
- `getit` for dependency inversion
- `linter` - for code rules.
- more at `pubspec.yaml`
