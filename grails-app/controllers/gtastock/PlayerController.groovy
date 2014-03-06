package gtastock

class PlayerController {

    def index() {
		
		createShare('BIN', 3.77, 5800861, 'Franklin');
		createShare('HVY', 1.44, 7071416, 'Franklin');
		createShare('SHK',5.86, 1767985, 'Franklin');
		createShare('SPU',1193.75, 18583, 'Franklin');
		createShare('WIZ', 0.61, 113114936, 'Franklin');
		
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
