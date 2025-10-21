Scenario: Log in as a Good User
Given I am on main application page
When I verify main application page
When I log in as ${swagGoodUserName} with ${swagPassword}
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html` 
When I take screenshot