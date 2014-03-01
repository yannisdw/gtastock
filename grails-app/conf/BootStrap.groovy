import grails.converters.JSON
import gtastock.StockEntry

class BootStrap {

    def init = { servletContext ->
	    JSON.registerObjectMarshaller(StockEntry) {
			def output = [:]
			output['share'] = it.share
			output['timestamp'] = it.timestamp
			output['value'] = it.value
			
			return output
	    }
    }
    def destroy = {
    }
	
	
}
