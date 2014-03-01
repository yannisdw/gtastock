package gtastock

import grails.converters.JSON

class StockEntryController {

	def StockEntryService stockEntryService
	
    def index() { 
		
		def entries = stockEntryService.getStockData("WIZ")
		
		render entries as JSON
		
	}
}
