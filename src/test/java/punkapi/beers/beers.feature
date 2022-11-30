Feature:

  Background:
    * url  'https://api.punkapi.com/v2'

  Scenario: successful api call
    Given path 'beers'
    When method get
    Then status 200

  Scenario: successful api call with id 1
    Given path 'beers/1'
    When method get
    Then status 200

  Scenario: successful api call with id 1 matching name
    Given path 'beers/1'
    When method get
    Then status 200
    And match response[0].name == "Buzz"

  Scenario: successful api call with id 1 retriving image
    Given path 'beers/1'
    When method get
    Then status 200
    And def img_url = response[0].image_url
    And url img_url
    When method get
    Then status 200

  Scenario: unsuccessful api call with id 100000
    Given path 'beers/100000'
    When method get
    Then status 404

  Scenario: unsuccessful api call with id awdawd
    Given path 'beers/awdawd'
    When method get
    Then status 400