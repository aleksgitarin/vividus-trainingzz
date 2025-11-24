Meta:
    @group Training
    @requirementId MyTask-0006

Lifecycle:
Examples:
|swagUserName|swagPassword|
|${swagGoodUserName}|${swagPassword}|
|${swagSlowUserName}|${swagPassword}|


Scenario: Navigate to the website homepage
Given I am on main application page
When I verify main application page

Scenario: Log In
When I log in as `<swagUserName>` with `<swagPassword>`
When I wait until element located by `caseSensitiveText(Sauce Labs Backpack)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I take screenshot

Scenario: Add item to the shopping cart
When I wait until element located by `caseSensitiveText(<itemName>)` appears 
When I click on element located by `caseSensitiveText(<itemName>)`
When I wait until element located by `caseSensitiveText(Back to products)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory-item.html?id=<itemPageId>`
When I navigate back
When I click on element located by `id(<addToCardButtonID>)`
When I take screenshot

Examples:
|itemName|itemPageId|addToCardButtonID|
|Sauce Labs Backpack|4|add-to-cart-sauce-labs-backpack|
|Sauce Labs Bike Light|0|add-to-cart-sauce-labs-bike-light|
|Sauce Labs Bolt T-Shirt|1|add-to-cart-sauce-labs-bolt-t-shirt|

Scenario: Validate the num of items in the shopping cart
When I wait until element located by `className(shopping_cart_badge)` appears
When I wait until element located by `className(shopping_cart_badge)` has text matching `3`
When I save text of element located by `className(shopping_cart_badge)` to SCENARIO variable `cartBadge`
Then `${cartBadge}` is equal to `3`
When I take screenshot

Scenario: Log Out
When I click on element located by `id(react-burger-menu-btn)`
When I wait until element located by `caseSensitiveText(Reset App State)` appears
When I click on element located by `id(reset_sidebar_link)`
When I click on element located by `id(logout_sidebar_link)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`
When I take screenshot