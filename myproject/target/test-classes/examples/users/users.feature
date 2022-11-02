@Smoke
Feature: exercise Rapid Api

  Scenario Outline: Status 200 validar que es un string
   Given url urlBase
   And header x-rapidapi-key = '<x-rapidapi-key>'
    And request {url:'https://crowdar.com.ar'}
    When method POST
    Then status <status>
    And match response.result_url == <result_url>
  Examples:
      |  x-rapidapi-key                                    |status | result_url|
      | 5bc1a34c40mshe27d32ebba28f93p1f3a18jsn222d7956a53b |200    | '#string' |


  Scenario Outline: Status 400 sin body Validar Response exitosamente
    * def response = read('classpath:examples/users/request/rapiApi.json')
   Given url urlBase
    And header x-rapidapi-key = '<x-rapidapi-key>'
    And request response.url
    When method POST
    Then status <status>
    And match response.error == '<error>'

  Examples:
      |   x-rapidapi-key                                 |status |error                  |
      |5bc1a34c40mshe27d32ebba28f93p1f3a18jsn222d7956a53b|400    |API Error: URL is empty|


  Scenario Outline:  Shorten Invalid URL - Status 400
    Given url urlBase
    And header x-rapidapi-key = '<x-rapidapi-key>'
    And request {url:'sdfadfadsfdfsdf'}
    When method POST
    Then status <status>
    And match response.error contains 'URL is invalid'

    Examples:
      |   x-rapidapi-key                                 |status |
      |5bc1a34c40mshe27d32ebba28f93p1f3a18jsn222d7956a53b|400    |

  Scenario Outline:  Shorten Invalid URL - Status 400
    Given url urlBase
    And header x-rapidapi-key = '<x-rapidapi-key>'
    And request {url:'https://crowdar.com.ar'}
    When method POST
    Then status <status>
    And match response.message contains 'You are not subscribed to this API'

    Examples:
      |x-rapidapi-key  |status|
      |asdasdas        |403   |




  