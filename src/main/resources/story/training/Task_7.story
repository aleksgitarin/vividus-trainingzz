Meta:
    @group Training
    @requirementId MyTask-0006

Scenario: Navigate to the website homepage
Given I am on main application page
When I verify main application page

Scenario: Log In
When I log in as `${swagGoodUserName}` with `${swagPassword}`
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

Scenario: Populate checkout data
When I click on element located by `className(shopping_cart_badge)`
When I wait until element located by `caseSensitiveText(Your Cart)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/cart.html`
When I click on element located by `id(checkout)`
When I wait until element located by `caseSensitiveText(Checkout: Your Information)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-one.html`
When I enter `#{generate(Name.firstName)}` in field located by `id(first-name)`
When I enter `#{generate(Lorem.characters '10' 'true')}` in field located by `id(last-name)`
When I enter `#{toUpperCase(#{generate(Lorem.characters '3')})}-#{generate(Lorem.characters '5')}` in field located by `id(postal-code)`
When I take screenshot

Scenario: Complete checkout process
Given I initialize SCENARIO variable `expectedMessage` with value `#{loadResource(/data/message.txt)}`
When I click on element located by `id(continue)`
When I wait until element located by `caseSensitiveText(Checkout: Overview)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-two.html`
When I click on element located by `id(finish)`
When I wait until element located by `caseSensitiveText(Checkout: Complete!)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-complete.html`
When I save text of element located by `xpath(//h2[@class="complete-header"])` to SCENARIO variable `thankYouMessage`
Then `#{eval(${thankYouMessage})` is equal to `#{eval(${thankYouMessage})`
When I take screenshot