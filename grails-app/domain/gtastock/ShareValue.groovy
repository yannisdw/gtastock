package gtastock

import org.bson.types.ObjectId;

class ShareValue {

	ObjectId id
	String playerName
	double buyingprice
	int amountbought
	String symbol
	
    static constraints = {
    }

	static mapping = {
		collection 'sharevalues'
	}
}
