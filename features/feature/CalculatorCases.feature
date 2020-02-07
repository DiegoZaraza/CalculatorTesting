Feature: Calculator

  Background:
    Given Enter de calculator

  Scenario Outline: Validate basic operations
    When Click the button '<number1>'
    And Click the button '<operator>'
    And Click the button '<number2>'
    And Click the button equal
    Then Validate result operation

    Examples:
      | number1 | operator | number2 |
      | 12354   | +        | 23653   |
      | 96789   | -        | 37908   |
      | 96789   | -        | 137908  |
      | 12789   | x        | 76      |
      | 8879    | ÷        | 23      |

  Scenario: Validate character quantity
    When Click the button '99999999'
    And Click the button '+'
    And Click the button '1'
    And Click the button equal
    Then Validate error in the operation

  Scenario: Execution complex operations
    When Click the button '9'
    And Click the button 'x'
    And Click the button '2'
    And Click the button '+'
    When Click the button '4'
    And Click the button 'x'
    And Click the button '3'
    And Click the button equal
    Then Validate result operation
