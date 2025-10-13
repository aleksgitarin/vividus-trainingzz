Scenario: Log in as a Good User
Given I am on main application page
When I verify main application page
When I log in as ${swagGoodUserName}
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I wait until element located by `caseSensitiveText(Sauce Labs Backpack)` appears  
Then text `Sauce Labs Backpack` exists
Then number of elements found by `className(inventory_item)` is EQUAL_TO `6`  
When I take screenshot