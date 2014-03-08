package gtastock

import grails.converters.JSON
import com.mongodb.*

class StockEntryController {

	def StockEntryService stockEntryService

	def mongo
	
	def mongoopvullen_beta() {
//		def db = mongo.getDB("mongo")
//		db.languages.insert([name: 'Groovy'])
		/*
		new RegisteredCompany(name:'TNK', niceFluctuating:true, buyingPrice: 4.0, sellingPrice: 10.0).save()
		new RegisteredCompany(name:'BDG', niceFluctuating:true, buyingPrice: 5.0, sellingPrice: 15.0).save()
		new RegisteredCompany(name:'WIZ', niceFluctuating:true, buyingPrice: 0.5, sellingPrice: 5.0).save()
		new RegisteredCompany(name:'HAL', niceFluctuating:true, buyingPrice: 1.0, sellingPrice: 3.0).save()
		new RegisteredCompany(name:'SHK', niceFluctuating:true, buyingPrice: 4.5, sellingPrice: 9.0).save()
		*/
		
		
//		def db = mongo.getDB("gta")
//		
//		def wallet = [
//				name:'Franklin', 
//				stocks: [ 
//					[	company: 'TNK', 
//						bewegingen: 
//							[	[amount:100, pricePerShare:3.5], 
//								[amount:20, pricePerShare:4]
//							]
//					] 
//				]]
//		db.playerWallets.insert(wallet)
		
//		def List<StockMovementEntry> stockMovements = new ArrayList<StockMovementEntry>()
//		stockMovements.add(new StockMovementEntry(amount:100, pricePerShare:3.5), new StockMovementEntry(amount:20, pricePerShare:4))
		
//		def List<PlayerStockEntry> stockList = new ArrayList<StockMovementEntry>()
//		stockList.add(new PlayerStockEntry(company:'TNK', bewegingen: stockMovements))
		
		PlayerWalletEntry.deleteAll(PlayerWalletEntry.findAll())
		
		def walletEntry = new PlayerWalletEntry(naam:'Franklin', stocks:[]).save()
		
		walletEntry.stocks.add(new PlayerStockEntry(company:'TNK', bewegingen: []));
		def indexOfStock = walletEntry.stocks.findIndexOf {it.company == 'TNK'}
		walletEntry.stocks[indexOfStock].bewegingen.add(new StockMovementEntry(amount:100, pricePerShare:3.5))
		walletEntry.stocks[indexOfStock].bewegingen.add(new StockMovementEntry(amount:20, pricePerShare:4))

		walletEntry.stocks.add(new PlayerStockEntry(company:'SPU', bewegingen: []));
		def indexOfSPU = walletEntry.stocks.findIndexOf {it.company == 'SPU'}
		walletEntry.stocks[indexOfSPU].bewegingen.add(new StockMovementEntry(amount:10000, pricePerShare:400))
		
		
		walletEntry.save(flush: true)
		
		def walletEntryMichael = new PlayerWalletEntry(naam:'Michael', stocks:[]).save()
		walletEntryMichael.stocks.add(new PlayerStockEntry(company:'TNK', bewegingen: []))
		def indexOfTNK = walletEntryMichael.stocks.findIndexOf {it.company == 'TNK' }
		walletEntryMichael.stocks[indexOfTNK].bewegingen.add(new StockMovementEntry(amount:1000, pricePerShare:4.6)) 
		
		walletEntryMichael.save(flush:true)
		
		
		
		PlayerWalletEntry.findByNaam('Franklin').stocks.each {
			log.info it.company
			it.bewegingen.each {
				log.info "aantal:" + it.amount + " pricePerShare: " + it.pricePerShare 
			}
		}
	}
	
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
