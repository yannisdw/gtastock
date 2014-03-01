package gtastock

import grails.test.mixin.TestFor
import spock.lang.Specification
import groovy.time.TimeCategory

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(StockEntryService)
@grails.test.mixin.Mock(StockEntry)
class StockEntryServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

   void "test find most recent stockEntry for company"() {
		
		expect: StockEntry.findAll().size() == 0
		
		when: 
		def now = new Date()
		def fiveMinutesAgo
		def tenMinutesAgo
		use(TimeCategory) {
			fiveMinutesAgo = now - 5.minutes
			tenMinutesAgo = now - 10.minutes
		}
		
		StockEntry entry = new StockEntry(share: "ABC", timestamp: fiveMinutesAgo)
		service.save(entry)
		StockEntry olderEntry = new StockEntry(share: "ABC", timestamp: tenMinutesAgo)
		service.save(olderEntry)
		
		
		def found = StockEntry.findByShare("ABC", [max: 1, sort: "timestamp", order: "desc"])
		
		then: fiveMinutesAgo == found.timestamp
		
	}
}
