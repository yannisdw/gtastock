package gtastock

import java.util.Date;

import org.bson.types.ObjectId;

class StockEntry {

	ObjectId id
	String share
	String timestamp
	Date insertDate
	double value
	
	static mapWith = "mongo"
	
	static mapping = {
		collection 'stockinfo'
	}
	
    static constraints = {
		
    }
}
