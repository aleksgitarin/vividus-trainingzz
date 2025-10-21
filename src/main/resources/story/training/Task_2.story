GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good User
When I enter `${swagGoodUserName}` in field located `xpath(//input[@id="user-name"])` using keyboard
When I enter `${swagPassword}` in field located `xpath(//input[@id="password"])` using keyboard
When I click on element located by `id(login-button)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `className(inventory_item)` is EQUAL_TO `6`  
When I take screenshot