GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as Locked User
When I log in as ${swagLockedUserName} with ${swagPassword}
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`

Scenario: Validating number of inventory items for Locked User
Then number of elements found by `className(inventory_item)` is EQUAL_TO `6`
When I take screenshot
