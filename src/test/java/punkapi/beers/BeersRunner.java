package punkapi.beers;

import com.intuit.karate.junit5.Karate;

class BeersRunner {
    
    @Karate.Test
    Karate testBeers() {
        return Karate.run("beers").relativeTo(getClass());
    }    

}
