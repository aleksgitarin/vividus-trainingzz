GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as Locked User
Given I am on main application page
When I verify main application page
When I log in as ${swagLockedUserName}
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `className(inventory_item)` is EQUAL_TO `6`
When I take screenshot
