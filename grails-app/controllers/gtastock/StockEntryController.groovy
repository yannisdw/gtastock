package gtastock

import grails.converters.JSON

class StockEntryController {

	def StockEntryService stockEntryService
	
	//url: http://localhost:8080/GTAStock/stockEntry?company=WIZ
    def index(String company) { 
		
		def entries = stockEntryService.getStockData(company)
		
		render entries as JSON
		
	}
	
	def chart() {
		
	}
	
	def chartBeta() {
		
	}
	
	def company(String name) {
		
		def entries = stockEntryService.getStockData(name)
				
				render entries as JSON
		
	}
	
	def allCompanies() {
		def resp = stockEntryService.getAllCompanies()
		log.debug(resp)
		render resp as JSON
	}
}
