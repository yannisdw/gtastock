package gtastock

import grails.transaction.Transactional

@Transactional
class StockEntryService {

	def getMostRecentStockEntryForCompany(def company) {
		return StockEntry.findByShare(company, [max: 1, sort: "timestamp", order: "desc"])
	}

	def save(StockEntry stockInfo) {
		stockInfo.save()
	}
	
	def findAll() {
		StockEntry.findAll()
	}
}
