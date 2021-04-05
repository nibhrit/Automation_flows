require "selenium-webdriver"
require "rspec"

#TEST: navigate to Google for particular search"
describe "Google" do 
	describe "Navigate to Google" do
		it "Search text" do

			driver = Selenium::WebDriver.for :chrome
			driver.manage.window.maximize
			driver.manage.timeouts.implicit_wait = 2


			#go google search
			driver.navigate.to "http://www.google.com"
		

			driver.find_element(:name, "q").send_keys "Paypal"
			driver.find_element(:name, "btnK").click

			#click on the link by the class of div which has the links (a href tag)
			driver.find_element(:class, 'yuRUbf').click 
			#//span[.='www.paypal.com/'] 

			driver.manage.timeouts.implicit_wait = 4


			#go google search
			driver.navigate.to "http://www.google.com"
		

			driver.find_element(:name, "q").send_keys "Selenium Automation"
			driver.find_element(:name, "btnK").click

			#click on the link by the class of div which has the links (a href tag)
			driver.find_element(:xpath, "//a[contains(@href,'https://www.selenium.dev/documentation/en/introduction/on_test_automation/')]").click()
			driver.manage.timeouts.implicit_wait = 4
		end
	end	
end