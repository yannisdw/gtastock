package gtastock

class StockEntryController {

	def StockEntryService stockEntryService
	
    def index() { 
		
		def entries = stockEntryService.getStockData("AB")
		
		[entryList:entries]
		
	}
}
