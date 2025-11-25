Meta:
    @group Training
    @requirementId MyTask-0008

Scenario: Navigate to the website homepage
Given I am on main application page
When I verify main application page

Scenario: Log In
When I log in as `${swagGoodUserName}` with `${swagPassword}`
When I wait until element located by `caseSensitiveText(Sauce Labs Backpack)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I take screenshot

Scenario: Add items to the shopping cart
When I click on element located by `className(product_sort_container)`
When I select `<sortingValue>` in dropdown located by `className(product_sort_container)`
When I click on element located by `xpath((//button[contains(@class,"btn_inventory")])[1])`
When I click on element located by `xpath((//button[contains(@class,"btn_inventory")])[last()])`
When I save text of element located by `className(shopping_cart_badge)` to SCENARIO variable `badgeActual`
Then `${badgeActual}` is equal to `<cartBadgeCount>`
When I take screenshot

Examples:
|sortingValue|cartBadgeCount|
|Price (low to high)|2|

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

Scenario: Validate order summary and complete order
When I click on element located by `id(continue)`
When I wait until element located by `caseSensitiveText(Checkout: Overview)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-two.html`
When I save text of element located by `xpath((//div[@class='inventory_item_price'])[1])` to SCENARIO variable `itemPrice1`
When I save text of element located by `xpath((//div[@class='inventory_item_price'])[2])` to SCENARIO variable `itemPrice2`
Given I initialize SCENARIO variable `itemPrice1Final` with value `#{eval("${itemPrice1}".substring(1))}`
Given I initialize SCENARIO variable `itemPrice2Final` with value `#{eval("${itemPrice2}".substring(1))}`
When I save text of element located by `xpath(//div[@class='summary_subtotal_label'])` to SCENARIO variable `subtotal`
Given I initialize SCENARIO variable `subtotalFinal` with value `#{eval("${subtotal}".replace('Item total: $',''))}`
Given I initialize SCENARIO variable `calculated-subtotal` with value `#{eval(${itemPrice1Final} + ${itemPrice2Final})}`
Then `#{eval("${calculated-subtotal}")}` is equal to `#{eval("${subtotalFinal}")}`
When I save text of element located by `xpath(//div[@class='summary_tax_label'])` to SCENARIO variable `tax`
Given I initialize SCENARIO variable `taxFinal` with value `#{eval("${tax}".replace('Tax: $',''))}`
Given I initialize SCENARIO variable `calculated-total` with value `#{eval(${subtotalFinal} + ${taxFinal})}`
Given I initialize SCENARIO variable `calculated-totalRounded` with value `#{round(${calculated-total}, 2)}`
When I save text of element located by `xpath(//div[@class='summary_total_label'])` to SCENARIO variable `total`
Given I initialize SCENARIO variable `totalFinal` with value `#{eval("${total}".replace('Total: $',''))}`
Then `#{eval("${calculated-totalRounded}")}` is equal to `#{eval("${totalFinal}")}`
When I click on element located by `id(finish)`
When I take screenshot


Scenario: Complete checkout process
Given I initialize SCENARIO variable `expectedMessage` with value `#{loadResource(/data/message.txt)}`
When I wait until element located by `caseSensitiveText(Checkout: Complete!)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-complete.html`
When I save text of element located by `xpath(//h2[@class="complete-header"])` to SCENARIO variable `thankYouMessage`
Then `#{eval(${thankYouMessage})` is equal to `#{eval(${thankYouMessage})`
When I take screenshot

