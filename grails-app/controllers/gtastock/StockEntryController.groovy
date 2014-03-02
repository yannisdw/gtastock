package gtastock

import grails.converters.JSON

class StockEntryController {

	def StockEntryService stockEntryService
	
	//url: http://localhost:8080/GTAStock/stockEntry?company=WIZ
    def index(String company) { 
		
		def entries = stockEntryService.getStockData(company)
		
//		render '[[1173052800000, 86.32], [1173139200000, 88.19], [1173225600000, 87.72]]'
		
		render entries as JSON
		
	}
	
	def chart() {
		
	}
	
	def chartBeta() {
		
	}
	
	def allCompanies() {
		def resp = stockEntryService.getAllCompanies() as JSON
		log.info(resp)
		render resp
	}
}
