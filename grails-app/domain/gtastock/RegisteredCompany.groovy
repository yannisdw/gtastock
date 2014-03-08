package gtastock

import org.bson.types.ObjectId

class RegisteredCompany {

	ObjectId id
	String company
	double buyingPrice
	double sellingPrice
	boolean niceFluctuating
	
    static constraints = {
    }
	
	static mapping = {
		collection 'registeredCompanies'
	}
}
