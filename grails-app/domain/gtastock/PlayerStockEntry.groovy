package gtastock

class PlayerStockEntry {

	String company
	List<StockMovementEntry> bewegingen
	
    static constraints = {
    }
	
	static embedded = ['bewegingen']
}
