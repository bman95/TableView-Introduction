//
//  CountryData.swift
//  TableView-Introduction
//
//  Created by Brendon Crowe on 12/14/22.
//

import Foundation

struct Country {
    let name: String
    let description: String
    let continent: String
    
    // Country.countries is a type property that can be used on a new instance
    
    static let countries = [
        Country(name: "Saint Lucia 🇱🇨", description: "Tropical 🏝 paradise. Known as Helen of the West. Only drive-in volcano. National dish is green banana and salt fish. ", continent: "North America"),
        Country(name: "Colombia 🇨🇴", description: "Historically troubled with natural beauty. Known for coffee (you’re welcome), ", continent: "South America"),
        Country(name: "Jamaica 🇯🇲", description: "West Indian/Caribbean utopia. Origin of Reggae/Dancehall.  Birthplace of Bob Marley & Vybz Kartel. Know for cuisine choices such as ackee & salt fish, jerk everything, and mango’s", continent: "North America"),
        Country(name: "Bangladesh 🇧🇩", description: "it’s hot.  Evidently the national dish is Hilsa Curry (hilsa is a fish).  But she likes tilapia. Muslin originally came from Bangladesh too. ", continent: "Asia"),
        Country(name: "America 🇺🇸", description: "Known as Land of the free! The American dream. Our national dish are hamburgers ( originally made from a Hamburg steak) ", continent: "North America"),
        Country(name: "India 🇮🇳", description: "Tropical country, very culturally diverse and curry is very popular there", continent: "Asia"),
        Country(name: "Ukraine 🇺🇦", description: "Country in Eastern Europe with wonderful climate (full four seasons). Known for its tasty food (national dish is Borsch with pampushki (garlic bread)) and cozy stylish cafes.", continent: "Europe"),
        Country(name: "Dominican Republic 🇩🇴", description: "Invented Mangu. Hot.", continent: "North America"),
        Country(name: "Nepal 🇳🇵", description: "Landlocked country, Hinduism and Buddhism are the two main religion. Cows are sacred and cant be kill. Known for Mt. Everest.", continent: "Asia"),
        Country(name: "Ecuador 🇪🇨", description: "City in Southern Ecuador. Known for hand crafted Panama hats :womans_hat:(and other things I can't remember...)", continent: "South America"),
        Country(name: "Nigeria 🇳🇬", description: "The home of Afro-beat. A true motherland.  The National dish is Jollof Rice which is known for being very spicy and can be filled with meat , chicken , or shrimp (just to name a few).", continent: "Africa"),
        Country(name: "Dominica 🇩🇲", description: "Dominica is a small island in the West Indies with a population of just under 75,000 people. One of it's national dances is the the Bele, a dance that displays it's national wear.", continent: "North America"),
        Country(name: "Mexico 🇲🇽", description: "One of North America's biggest countries, known for its great tasting spices and food and hard working people", continent: "North America"),
        Country(name: "Russia 🇷🇺", description: "Largest country in the world. It shares borders with 14 countries and has 9 time zones. Russia won World War 2. National dish is Vodka.", continent: "Europe")
    ]
    
    // type method
    // this method creates an array of arrays by using the continent title as the section
    static func getSections() -> [[Country]] {
        // function that gores through the countries and sorts all the elements by continent
        // < means ascending a...z
        // > means descending z...a
        // this constant is an array of sorted countries by ascending continents
        let sortedContinents = countries.sorted { $0.continent < $1.continent }
        // creates unique contient titles
        let continentTitles: Set<String> = Set(countries.map { $0.continent })
        var sectionsArray = Array(repeating: [Country](), count: continentTitles.count)
        // create (count) empty arrays of type [Country]
        // [[], [], [], [], [],]
        // next step is to iterate through the countries array and add to the relevant sections
        var currentIndex = 0
        var currentContinent = sortedContinents.first?.continent ?? "No Continent"
        for country in sortedContinents {
            if country.continent == currentContinent {
                // add to current  section
                sectionsArray[currentIndex].append(country)
            } else { // moving to a new continent
                currentIndex += 1
                currentContinent = country.continent // updating the current continent
                sectionsArray[currentIndex].append(country)
            }
        }
        //        print("we currently have \(continentTitles.count) continents in our data")
        //        print("continents: \(continentTitles)")
        return sectionsArray
    }
    
}
