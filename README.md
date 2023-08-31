
# [FoodHaven](https://food-haven.onrender.com/)

In a world with food deserts, Food Haven supplies the public with location services for local farmer's markets. The search for markets focuses on farmer's markets that accept Supplemental Nutrition Assistance Program (SNAP) benefits and identifies the type of benefit assistance at the market if the data is available. The user can then select a market they wish to visit and utilizing the maps portion of the application, the user may locate public service transit routes and schedules available to connect them to the market from their current location.

## Features

- **Light/Dark Mode Toggle**: Allow users to switch between light and dark themes.
- **Cross Platform**: Compatible with various devices and operating systems.
- **User Geolocation**: Utilize user's location for personalized content or services.
- **Responsive Web Design**: Ensures optimal viewing experience across different devices and screen sizes.

## Tech Stack

**Client:** 
 - Bootstrap (styling)
 - HTML (structure)

**Server:** 
 - Ruby (language)
 - Ruby on Rails (framework)

## Gems

- dotenv-rails
  - Documentation for dotenv-rails can be found here: https://www.rubydoc.info/gems/dotenv-rails/2.1.1
     
- omniauth
  - Documentation for omniauth can be found here: https://www.rubydoc.info/gems/omniauth/1.6.1

- omniauth-google-ouath2
  - Documentation for omniauth-google-outh2 can be found here: https://github.com/zquestz/omniauth-google-oauth2
    
- omni-rails_csrf_protection
  - Documentation for omni-rails_csrf_protection can be found here: https://github.com/cookpad/omniauth-rails_csrf_protection

- Faraday
  - Used for HTTP request to APIs 
  - Documentation for Faraday can be found here: https://lostisland.github.io/faraday/#/

- Figaro
  - Used to mask API key(s) from files. 
  - Documentation for Figaro can be found here: https://rubygems.org/gems/figaro/versions/1.1.1
    
- jsbundling-rails
  - Documentation for jsbundling-rails can be found here: https://github.com/rails/jsbundling-rails

- geocoder
  - Documentation for Ruby geocoder can be found here: http://www.rubygeocoder.com/
    
## Installation

- Google Oauth 2.0
  - Food Haven features Google Outh as an option to login. When running this program on a local server, users will need OAuth client ID and client secret for this feature to function correctly.
    You can follow the steps to get the required credentials here: https://developers.google.com/identity/protocols/oauth2/web-server
      - Once you have the required credentials make an .env file at the root directory and put the crederntials in that .env file.
        - GOOGLE_CLIENT_ID = YOUR_GOOGLE_CLIENT_ID
        - GOOGLE_CLIENT_SECRET = YOUR_SECRET_KEY
          
## Running Tests

To run tests, run the following command

```bash
  bundle exec rspec
```

## Consumed APIs

This project interacts with  external APIs to provide additional functionality and data. Below are the details of the APIs consumed:

### Microservice
- **Endpoint**: `https://foodhaven-be.onrender.com`
- **Usage**: USDA Local Food Portal farmers market directory [here](https://www.usdalocalfoodportal.com/fe/datasharing/)
- **Documentation**: [Microservice Documentation](https://github.com/FoodHaven/microservice_sinatra)

### Google Maps API
- **Endpoint**: `https://maps.googleapis.com/maps/api/geocode/json`
- **Usage**: User geolocation, rendering interactive maps, and providing navigation features.
- **Documentation**: [Google Maps API Docs](https://developers.google.com/maps/documentation)
  
## Authors

### Kailey Kaes
#### [@kaileykaes](https://github.com/kaileykaes) 
#### [LinkedIn](https://www.linkedin.com/in/kaileykaes/)

### Jesse Sorman
#### [@Jesse193](https://github.com/Jesse193) 
#### [LinkedIn](https://www.linkedin.com/in/jesse-sorman/)

### Andy Stilmock
#### [@AStilmock](https://github.com/AStilmock) 
#### [LinkedIn](https://www.linkedin.com/in/andrew-stilmock-9ba598270/)

### Kim Bergstrom
#### [@kbergstrom78](https://github.com/kbergstrom78)
#### [LinkedIn](https://www.linkedin.com/in/kimberley-bergstrom/)

## Acknowledgements

- Bootstrap Template https://demos.creative-tim.com/material-kit
