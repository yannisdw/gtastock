package gtastock

class StockEntryController {

	def StockEntryService stockEntryService
	
    def index() { 
		
		def entries = stockEntryService.getStockData("WIZ")
		
		[entryList:entries]
		
	}
}
