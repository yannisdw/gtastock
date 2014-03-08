package gtastock

import org.bson.types.ObjectId

class PlayerWalletEntry {

	ObjectId id
	String naam
	List<PlayerStockEntry> stocks
	
    static constraints = {
    }
	
	static embedded = ['stocks']
	
	static mapping = {
		collection 'playerWallets'
	}
}
