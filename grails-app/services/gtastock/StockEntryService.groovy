package gtastock

import grails.transaction.Transactional

@Transactional
class StockEntryService {

	def getMostRecentStockEntryForCompany(def company) {
		StockEntry.findAllByShare(company, [max: 1, sort: "timestamp", order: "desc"])
	}

	def getStockData(def company) {
		log.debug("find the stuff for company ${company}")
		return StockEntry.findAllByShare(company, [max:100])
	}
	
	def save(StockEntry stockInfo) {
		stockInfo.save()
	}
	
	def findAll() {
		StockEntry.list()
	}
}
