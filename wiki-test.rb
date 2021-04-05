require "selenium-webdriver"
require "rspec"

#TEST: navigate to Google for particular search"
describe "Wikipedia" do 
	describe "Navigate to wikipedia" do
		it "Search Software" do

			driver = Selenium::WebDriver.for :chrome
			driver.manage.window.maximize
			driver.manage.timeouts.implicit_wait = 2


			#go to wikipedia
			driver.navigate.to "http://www.wikipedia.org"
		
			#go to english site
			driver.find_element(:id, "js-link-box-en").click

			sleep(5)
			searchbox = driver.find_element(:id, "searchInput")
			searchbox.send_keys "Software"
			searchbox.submit
			sleep(5)

			driver.quit
		end
	end	
end