grails {
	mongo {
		host = "localhost"
		port = 27017
		username = ""
		password = ""
//		databaseName = "gta"
	}
}

environments {
	
	development {
		grails {
			mongo {
				databaseName = "gtaDevelopment"
			}
		}
	}
	
	production {
		
		grails {
			mongo {
				databaseName = "gta"
			}
		}
	}
	
}