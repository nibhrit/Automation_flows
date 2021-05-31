require "selenium-webdriver"
require "rspec"

#sample set_txn_req_tid: 115272459759369978
#its TXN-REF(Request): 20491636992543459:14:FSM

TXN_REF_Request_id = "20491636992543459:14:FSM"


def Jarvis_Settlements()
#/html/body/div[1]/div[3]/div[2]/ul/li[4]/div/a/h4	xpath=//h4[text()='Settlements Reimagined']
	@driver.find_element(:xpath,"//h4[text()='Settlements Reimagined']").click
	#@driver.find_element(:xpath,"/html/body/div[1]/div[3]/div[2]/ul/li[4]/div/a/h4").click
	#SettlementsReimagined = @driver.find_element(:xpath,"/html/body/div[1]/div[3]/div[2]/ul/li[4]/div/a/h4")
	#SettlementsReimagined.click
end

def Search_Transactions()
	#/html/body/div[1]/div[3]/div[2]/table/tbody/tr[1]/td[3]/div/div/a[1]  xpath=//a[text()='Search Transactions'] 
	@driver.find_element(:xpath,"//a[text()='Search Transactions']").click
	#@driver.find_element(:xpath,"/html/body/div[1]/div[3]/div[2]/table/tbody/tr[1]/td[3]/div/div/a[1]").click
end
def TXN_Request(*i)
	#<input id="settlement2_search_input" type="text" maxlength="65" placeholder="" class="input-xxlarge" name="attr_value" value="115272459759369978">
	#//*[@id='settlement2_search_input']
	@driver.find_element(:xpath,"//*[@id='attr_select']").click
	@driver.find_element(:xpath,"//*[@value='SET_TXN_REQ_TID']").click
	@driver.find_element(:xpath,"//*[@id='settlement2_search_input']").clear
	@driver.find_element(:xpath,"//*[@id='settlement2_search_input']").send_keys(i)
end

def Search
	#//*[@id="settlement2_search_submit"]
	@driver.find_element(:xpath,"//*[@id='settlement2_search_submit']").click
end
def DeveloperView
	#//*[@id="accordion2"]/div[2]/div[1]/a
	@driver.find_element(:xpath, "//a[contains(@href,'#collapseTwo')]").click
	sleep(4)
end

def getSPMDetails
	#//*[id='collapseTwo']/div/table/tbody/tr[1]/td[8]/a
	@driver.find_element(:xpath, "//*[@id='collapseTwo']/div/table/tbody/tr[1]/td[8]/a").click
	sleep(7)
end

def closeDetails
	#//*[@id="accordion2"]/div[2]/div[1]/a
	@driver.find_element(:xpath, "//*[@class='btn']").click
	sleep(2)
end


describe "Jarvis" do
	describe "Settlements Reimagined" do
		describe "Search Transactions" do
			describe "TXN-REF(Request)" do
				it "checks the SPM Details successfully" do

					@driver = Selenium::WebDriver.for :chrome
					@driver.manage.window.maximize
					@driver.manage.timeouts.implicit_wait = 2

					#go to Jarvis stage
					@driver.navigate.to "https://finsysadmin.msmaster.qa.paypal.com/"
					#click on SettlementsReimagined
					Jarvis_Settlements()
					#click on SearchTransactions
					Search_Transactions()

					@arr = IO.readlines("settlementIDs.txt")
					for index in @arr do
 						 
 						#TXN_REF_Request()
						TXN_Request(index)
						#search
						Search()
						#DeveloperView
						DeveloperView()
						#get SPM Details
						getSPMDetails()
						#close details view
						closeDetails()

					end
				end

			end
		end
	end
end
