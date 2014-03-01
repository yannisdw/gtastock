package gtastock

class StockEntryController {

	def StockEntryService stockEntryService
	
    def index() { 
		
		stockEntryService.findAll()
		
		
	}
}
