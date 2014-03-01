package gtastock

class StockEntryController {

//	def StockEntryService stockEntryService
	
    def index() { 
		
//		def entries = stockEntryService.getStockData("PIS")
		
		StockEntry local = new StockEntry(share:'AB', timestamp:new Date(),value:100 )
		local.save()
//		stockEntryService.save(local)
		
		
		
		def entries = [local]
		
		[entryList:entries]
		
	}
}
