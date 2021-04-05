require "selenium-webdriver"
require "rspec"




driver = Selenium::WebDriver.for:chrome
#driver.manage.timeouts.implicit_wait = 100
#driver.timeouts.page_load = (100)
#driver.navigate.to "https://www.google.com/"



#wait = Selenium::WebDriver::Wait.new(:timeout => 10)
#wait.until { driver.get("https://www.google.com") }
#/html/body/div[1]/div[3]/form/div[1]/div[1]/div[3]/center/input[1]
driver.manage().timeouts().implicit_wait= 5;
driver.get "https://duckduckgo.com/"
if driver.find_element(:xpath,"//*[@id='search_button_homepage']")
puts "Found element by xpath"
else
puts "Not found"
end