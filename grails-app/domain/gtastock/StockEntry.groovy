package gtastock

import java.util.Date;

import org.bson.types.ObjectId;

class StockEntry {

	ObjectId id
	String share
	Date timestamp
	double value
	
	static mapWith = "mongo"
	
	static mapping = {
		collection 'stockinfo'
	}
	
    static constraints = {
		
    }
}
