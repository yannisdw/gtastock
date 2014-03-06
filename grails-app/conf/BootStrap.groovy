import grails.converters.JSON
import gtastock.StockEntry
import gtastock.to.PlayerStockTO

class BootStrap {

    def init = { servletContext ->
	    JSON.registerObjectMarshaller(StockEntry) {
			def output = [:]
			output['share'] = it.share
			output['timestamp'] = it.timestamp
			output['value'] = it.value
			
			return output
	    }
		
		JSON.registerObjectMarshaller(PlayerStockTO) {
			def o = [:]
			o['buyingprice'] = it.buyingValue
			o['currentprice'] = it.currentValue
			o['amountbought'] = it.amountBought
			o['symbol'] = it.stockName
			return o
		}
    }
    def destroy = {
    }
	
	
}
