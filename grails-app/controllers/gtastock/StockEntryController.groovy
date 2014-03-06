package gtastock

import grails.converters.JSON

class StockEntryController {

	def StockEntryService stockEntryService

	//url: http://localhost:8080/GTAStock/stockEntry?company=WIZ
	//    def index(String company) {
	//
	//		def entries = stockEntryService.getStockData(company)
	//
	//		render entries as JSON
	//
	//	}

	def chart() {

	}

	def chartBeta() {

	}

	def createStockForPlayer() {
		def body = request.JSON
		
		stockEntryService.createNewShareValue(body.amount.toInteger(), body.price.toDouble(), body.playerName, body.company)
		response.status = 200
	}
	
	def stockDataForPlayer(String playerName) {
		def t = stockEntryService.getStockDataForPlayer(playerName)
		render t as JSON
	}

	def allPlayerNames() {
		def t = stockEntryService.getSpelers()
		render t as JSON
	}

	def company(String name) {

		def entries = stockEntryService.getStockData(name)
		render entries as JSON

	}

	def allCompanyNames() {
		def resp = stockEntryService.getAllCompanyNames()
		render resp as JSON
	}
}
