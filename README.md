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
- [x] Internationalization
- [X] State-management and DI implemented using `flutter_bloc`
- [x] App icon
  added <img src="https://github.com/olndl/weather_app/blob/f/refactoring/screenshots/icon.png" width="25" />
- [X] Theme support

## Screenshots

<p float="center">
<img src="https://github.com/olndl/weather_app/blob/dev/screenshots/mock-0.png" width="220" height="380"/>
<img src="https://github.com/olndl/weather_app/blob/dev/screenshots/mock-1.png" width="220" height="380"/>
<img src="https://github.com/olndl/weather_app/blob/dev/screenshots/mock-2.png" width="220" height="380"/>
<img src="https://github.com/olndl/weather_app/blob/dev/screenshots/mock-3.png" width="220" height="380"/>
<img src="https://user-images.githubusercontent.com/82782889/220498373-6830b1d1-4258-4d2f-91b3-2aff5e79fa79.png" width="220" height="380"/>
</p>

## Video

https://user-images.githubusercontent.com/82782889/220505039-95ac0341-bee8-4b04-b3d2-df14fe8baa86.mov

## Packages Used

- `flutter_bloc` for state management.
- `dio` to work with Http client.
- `freezed` - code generator for data-classes
- `getit` for dependency inversion
- `linter` - for code rules.
- more at `pubspec.yaml`
