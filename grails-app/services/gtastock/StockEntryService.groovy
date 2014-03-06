package gtastock

import grails.transaction.Transactional
import gtastock.to.PlayerNameTO
import gtastock.to.PlayerStockTO


@Transactional
class StockEntryService {

	def getMostRecentStockEntryForCompany(def company) {
		StockEntry.findAllByShare(company, [max: 1, sort: "timestamp", order: "desc"])
	}

	def getStockData(def company) {
		return StockEntry.findAllByShare(company, [max:100000, sort: "timestamp", order: "asc"])
	}
	
	def getSpelers() {
		
		def spelernamen = ShareValue.where {}.projections {distinct 'playerName'}
		return spelernamen.list()
//		def tos = spelernamen.collect {
//			def to = new PlayerNameTO()
//			to.name = it
//			to
//		}
//		
//		log.debug('tos:' + tos)
//		
//		return tos
	}
	
	def createNewShareValue(int amount, double price, String playerName, String company) {
		new ShareValue(playerName: playerName, buyingprice: price, amountbought: amount, symbol: company).save()
	}
	
	def getStockDataForPlayer(def playerName) {
		def shareValuesForPlayer = ShareValue.findAllByPlayerName(playerName)
		def toObjects = shareValuesForPlayer.collect {
			PlayerStockTO t = new PlayerStockTO()
			t.amountBought = it.amountbought
			t.buyingValue = it.buyingprice
			t.stockName = it.symbol
			def v = getMostRecentStockEntryForCompany(it.symbol).value.get(0)
			t.currentValue = v
			t
		}
		return toObjects
		
	}
	
	def getAllCompanyNames() {
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
