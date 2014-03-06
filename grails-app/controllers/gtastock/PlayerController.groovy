package gtastock

class PlayerController {

    def index() {
		
		println "voor remove: " + ShareValue.count() + " objects in db"
		
		ShareValue.deleteAll(ShareValue.findAll())
		println "na remove: " + ShareValue.count() + " objects in db"
		
		createShare('TNK', 4.9, 13592550, 'Trevor');
		createShare('TNK', 4.9, 13864406, 'Franklin');
		createShare('SPU', 1197.77, 253277, 'Franklin');
		createShare('TNK', 4.9, 4946342, 'Michael');
		println "na insert: " +ShareValue.count() +" objects in db"
		
	}
	
	def createShare(name,buyingvalue, amountbought, playerName) {
		new ShareValue(
			playerName:playerName,
			symbol: name,
			buyingprice: buyingvalue,
			amountbought:amountbought
			).save();
	}
}
