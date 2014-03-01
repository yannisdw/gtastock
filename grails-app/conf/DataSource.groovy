grails {
	mongo {
		host = "localhost"
		port = 27017
		username = ""
		password = ""
		databaseName = "gta"
	}
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
    development {
    }
    test {
    }
    production {
    }
}
