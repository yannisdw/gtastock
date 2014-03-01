package gtastock

import grails.transaction.Transactional

@Transactional
class StockEntryService {

	def getMostRecentStockEntryForCompany(def company) {
		StockEntry.findByShare(company, [max: 1, sort: "timestamp", order: "desc"])
	}

	def getStockData(def company) {
		StockEntry.findByShare(company, max:100)
	}
	
	def save(StockEntry stockInfo) {
		stockInfo.save()
	}
	
	def findAll() {
		StockEntry.list()
	}
}
