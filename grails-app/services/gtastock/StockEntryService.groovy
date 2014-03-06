package gtastock

import grails.transaction.Transactional
import gtastock.to.PlayerStockTO


@Transactional
class StockEntryService {

	def getMostRecentStockEntryForCompany(def company) {
		StockEntry.findAllByShare(company, [max: 1, sort: "timestamp", order: "desc"])
	}

	def getStockData(def company) {
//		log.debug("find the stuff for company ${company}")
		return StockEntry.findAllByShare(company, [max:100000, sort: "timestamp", order: "asc"])
	}
	
	def getSpelers() {
		def t = ShareValue.where {}.projections {distinct 'playerName'}
		return t.list()
	}
	
	def getStockDataForPlayer(def playerName) {
		def shareValuesForPlayer = ShareValue.findAllByPlayerName(playerName)
		
		
		def tos = new ArrayList()
				
		def toObjects = shareValuesForPlayer.collect {
			PlayerStockTO t = new PlayerStockTO()
			t.amountBought = it.amountbought
			t.buyingValue = it.buyingprice
			t.stockName = it.symbol
			def v = getMostRecentStockEntryForCompany(it.symbol).value.get(0)
			t.currentValue = v
			t
		}
		log.info toObjects
		return toObjects
		
	}
	
	def getAllCompanies() {
		def t = StockEntry.where {}.projections {distinct 'share'}
		return t.list()
	}
	
	def save(StockEntry stockInfo) {
		stockInfo.save()
	}
	
	def findAll() {
		StockEntry.list()
	}
}
