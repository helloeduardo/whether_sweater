# Whether, Sweater? - A Road Trip Weather API

  <h3 align="center">Whether, Sweater?</h3>

  <p align="center">
    Whether, Sweater? is an API developed to help plan a road trip with weather and restaurant information. This API consumes 4 other public APIs in addition to implementing user management features.
    <br />
    <a href="https://github.com/helloeduardo/whether_sweater/issues">Report Bug</a>
    ·
    <a href="https://github.com/helloeduardo/whether_sweater/issues">Request Feature</a>
    <br />
    🥵🥶🩴🧤🧣🌂🧳☀️☁️⛈❄️☔️🍔🥡🌮🍕🚗🚦🛣🏞🌅📸🕒
  </p>
</p>


<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
  * [Schema](#schema)
* [Usage](#usage)
  * [Endpoints](#endpoints)
    * [Forecast](#forecast)
    * [Backgrounds](#backgrounds)
    * [Munchies](#munchies)
    * [User Registration](#user-registration)
    * [User Authentication](#user-authentication)
    * [Road Trip](#road-trip)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [Contact](#contact)


<!-- ABOUT THE PROJECT -->
## About The Project

This API consumes information from the MapQuest Geocoding and Directions APIs, Unsplash Image Search API, Yelp Business Search API, and the OpenWeather One Call API. In addition to consolidating various road trip information, this API manages user access to allow a front-end to register and authenticate users. Data is exposed in API endpoints compliant with the [JSON API Specification](https://jsonapi.org).


<!-- GETTING STARTED -->
## Getting Started

To use Whether, Sweater? locally, you can fork or clone [this](https://github.com/helloeduardo/whether_sweater) repo.

### Prerequisites
* [Ruby 2.5.3](https://github.com/ruby/ruby)
* [Rails 5.2.4.4](https://github.com/rails/rails)

### Installation
Below are the commands you will need to run in your terminal once you are inside the project root directory.

* Bundle Install
```
$ bundle exec install
```
* Set up Database
```
$ rails db:create
$ rails db:migrate
```
* Sign-Up for API Keys
  * [OpenWeather](https://openweathermap.org/api/one-call-api)
  * [MapQuest](https://developer.mapquest.com/documentation/)
  * [Unsplash](https://unsplash.com/documentation)
  * [Yelp](https://www.yelp.com/developers/v3/manage_app)
* Set up API access
```
$ figaro install
```
In your `config/application.yml` file, input your API keys
```
WEATHER_API_KEY: "<Your OpenWeather API Key>"
GEOCODING_API_KEY: "<Your MapQuest API Key>"
IMAGE_API_KEY: "<Your Unsplash API Key>"
YELP_API_KEY: "Bearer <Your Yelp API Key>"
```

### Schema

After running your migrations, your schema will look something like this!
<br />
<p align="center">
    <img src="https://user-images.githubusercontent.com/56360157/105139080-0b4a5a00-5ab3-11eb-894b-ee4148293f3d.png">
</p>


<!-- USAGE EXAMPLES -->
## Usage

Run ```rails s``` in your terminal and utilize ```http://localhost:3000/``` as the base url in your API client of choice (Postman, etc.)

### Endpoints

#### Forecast

This forecast endpoint retrieves the weather for a city when given a `location` parameter.

```
GET /api/v1/forecast?location=denver,co
```

Example JSON response:
```json
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-01-20T07:37:06.000Z",
                "sunrise": "2021-01-20T14:16:35.000Z",
                "sunset": "2021-01-21T00:05:12.000Z",
                "temperature": 29.44,
                "feels_like": 23.81,
                "humidity": 65,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "clear sky",
                "icon": "01n"
            },
            "daily_weather": [
                {
                    "date": "2021-01-20T19:00:00.000Z",
                    "sunrise": "2021-01-20T14:16:35.000Z",
                    "sunset": "2021-01-21T00:05:12.000Z",
                    "max_temp": 50.65,
                    "min_temp": 29.44,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                // ... the next 4 days of daily data
            ],
            "hourly_weather": [
                {
                    "time": "07:00:00",
                    "temperature": 29.44,
                    "wind_speed": "6.38 mph",
                    "wind_direction": "from SSW",
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                // ... the next 7 hours of hourly data
            ]
        }
    }
}
```

#### Backgrounds

This backgrounds endpoint retrieves a background photo for a city when given a `location` parameter.

```
GET /api/v1/backgrounds?location=denver,co
```

Example JSON response:
```json
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "location": "denver,co",
            "image_url": "https://images.unsplash.com/photo-1600041161228-519e6dd27bac?crop=entropy&cs=srgb&fm=jpg&ixid=MXwxOTk3MDN8MHwxfHNlYXJjaHwxfHxkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&q=85",
            "credit": {
                "source": "unsplash.com",
                "author": "mikekilcoyne",
                "logo": "https://unsplash-assets.imgix.net/marketing/press-logotype-stacked.svg?auto=format&fit=crop&q=60"
            }
        }
    }
}
```

#### Munchies

This munchies endpoint retrieves food and forecast information for a destination city. Requires a `start` and `end_location` cities in addition to a type of `food` cuisine.

```
GET /api/v1/munchies?start=denver,co&end_location=pueblo,co&food=chinese
```

Example JSON response:
```json
{
  "data": {
    "id": "null",
    "type": "munchie",
    "attributes": {
      "destination_city": "Pueblo, CO",
      "travel_time": "1 hours 48 min",
      "forecast": {
        "summary": "Cloudy with a chance of meatballs",
        "temperature": "83"
      },
      "restaurant": {
        "name": "Chinese Restaurant",
        "address": "4602 N. Elizabeth St, Ste 120, Pueblo, CO 81008"
      }
    }
  }
}
```

#### User Registration

This endpoint creates a user and renders a JSON representation of the new user.

```
POST /api/v1/users
```
The body of the post request is a JSON payload:
```json
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

Example JSON response:
```json
{
  "data": {
    "type": "user",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

#### User Authentication

This endpoint authenticates an existing user and renders a JSON representation of the existing user.

```
POST /api/v1/sessions
```
The body of the post request is a JSON payload:
```json
{
  "email": "whatever@example.com",
  "password": "password"
}
```

Example JSON response:
```json
{
  "data": {
    "type": "user",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

#### Road Trip

This road trip endpoint retrieves travel time and weather for a destination. This endpoint restricts access to users via authentication by their api key.

```
POST /api/v1/road_trip
```
The body of the post request is a JSON payload:
```json
{
  "origin": "Denver,CO",
  "destination": "Estes Park, CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Example JSON response:
```json
{
  "data": {
    "id": null,
    "type": "road_trip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes",
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/helloeduardo/whether_sweater/issues) for a list of proposed features, known issues, and project extensions.

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make this community such an amazing and fun place to learn, grow, and create! Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch ```git checkout -b feature/NewGreatFeature```
3. Commit your Changes ```git commit -m 'Add some NewGreatFeature'```
4. Push to the Branch ```git push origin feature/NewGreatFeature```
5. Open a new Pull Request!


<!-- CONTACT -->
## Contact

Eduardo Parra - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/eduardo--parra/) - [![GitHub][github-shield]](https://github.com/helloeduardo)


<!-- MARKDOWN LINKS & IMAGES -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[github-shield]: https://img.shields.io/badge/-GitHub-black.svg?style=flat-square&logo=github&colorB=555
