Scenario: Log in as a Good User
Given I am on main application page
When I verify main application page
When I log in as ${swagGoodUserName} with ${swagPassword}
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`

Scenario: Validation of inventory page after login
Then number of elements found by `className(inventory_item)` is EQUAL_TO `6`

Scenario: Visual validation of Inventory Page
When I COMPARE_AGAINST baseline with name `homepage` ignoring:
|ELEMENT                                   |ACCEPTABLE_DIFF_PERCENTAGE|
|xpath(//img[@class='inventory_item_img']) |10                        |
When I take screenshot
