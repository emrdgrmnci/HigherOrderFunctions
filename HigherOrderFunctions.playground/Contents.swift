import UIKit

// MAP Examples (Time Complexity: O(n))
//*********************************************
//Convert km's to miles
let kilometers = [10.0, 22.0, 55.0, 74.0]

let miles = kilometers.map { $0 * 1.6 }
print("Kilometers converted to feet: \(miles)")

//Make all words upppercased

let planetNames = ["mars", "jupiter", "mercury", "saturn", "earth"
, "neptune", "uranus", "venus"]

let capitalizedPlanetNames = planetNames.map { $0.capitalized}
print("Planet names capitalized: \(capitalizedPlanetNames)")

// Map the array of addresses to an array of zipcodes

class Address {
    var street: String
    var zipcode: Int
init(street: String, zipcode: Int) {
    self.street = street
    self.zipcode = zipcode
}
}

var addresses = [Address]()
addresses.append(Address(street: "Merkez", zipcode: 35080))
addresses.append(Address(street: "Rafetpasa", zipcode: 35090))

let zipcodes = addresses.map {$0.zipcode}
print("Zip codes: \(zipcodes)")
//*********************************************

// FILTER Examples(Time Complexity: O(n))
//*********************************************

//Filter only the planets that start with the letter "M"
let filteredPlanetNames = planetNames.filter {$0.prefix(1).uppercased() == "M"}
print("Count of filtered planet names: \(filteredPlanetNames.count)")

//Filter the address array to only addresses from zip code 1200

let filteredAddresses = addresses.filter {$0.zipcode == 35080}
print("Count of filtered addresses: \(filteredAddresses.count)")
//*********************************************

// REDUCE Examples(Time Complexity: O(n))
//*********************************************

//Sum of numbers - version 1
let numbers = [5, 3, 2, 6, 10, 23, 01, 43, 5, 7, 8, 9]

let sumOfNumbers = numbers.reduce(0, {$0 + $1})
print("Sum of numbers - version 1: \(sumOfNumbers)")

let sumOfNumbers2 = numbers.reduce(0, +)
print("Sum of numbers - version 2: \(sumOfNumbers2)")

//Longest planet name

let longestPlanetName = planetNames.reduce("", {$0.count > $1.count ? $0 : $1})
print("Longest planet name: \(longestPlanetName)")

// SORTED Examples(Time Complexity: O(n log n))
//*********************************************

//Soritng numbers ascending

let sortedNumbersAcendingOrders = numbers.sorted()
print("Sorted numbers ascending order: \(sortedNumbersAcendingOrders)")

//Sorted numbers descending - version1

let sortedNumbersDescendingOrders = numbers.sorted { (a,b) -> Bool in
    a > b
}

print("Sorted numbers descending order - version 1: \(sortedNumbersDescendingOrders)")

//Sorted numbers descending - version2

let sortedNumbersDescendingOrders2 = numbers.sorted { $0 > $1 }

print("Sorted numbers descending order - version 2: \(sortedNumbersDescendingOrders2)")

//FLATMAP Time complexity: O(m + n)
//*********************************************

//Flatmap without optionals

let names = [["roxana", "peter", "jacob", "morten"], ["iben", "nour", "nicolai"]]

let flatNames = names.flatMap({$0.sorted()})
print("Flatmap of names sorted: \(flatNames)")

//Flat Flatmap without optionals
let flatFlatNames = flatNames.flatMap({$0.sorted()})
print("Flat Flatmap of names sorted: \(flatFlatNames)")

//Flat with optionals
let scores = ["1", "2", "three", "four", "5"]

let flatMapNumbers: [Int?] = scores.flatMap { str in Int(str)}
print("Flatmap numbers: \(flatMapNumbers)")

//COMPACTMAP Time complexity: O(m + n) CompactMap can be “used as flatMap”, when you work with optional values. CompactMap can be used to either give you nil-values (which flapMap can’t), but also to filter out nil-values from a sequence.
//*********************************************

//Compact map with optionals
let compactMapped: [Int?] = scores.compactMap { str in Int(str)}
print("Compact map with optionals: \(compactMapped)")

//Compact map without optionals
let compactMapNumbers: [Int] = scores.compactMap{str in Int(str)}
print("Compact map without optionals: \(compactMapNumbers)")


//CHAINING: hat we can combine(chain) them. This means that what would normally have taken many lines of code can be reduced to a single line.
//*********************************************

//An array of street names from a specific zipcode
let streetNamesFromZipcode = addresses.filter {$0.zipcode == 35080}.map  {$0.street}
print("Street names from specific zipcode: \(streetNamesFromZipcode)")

//An array of sorted capitalized planet names
let sortedCapitalizedPlanetNames = planetNames.map {$0.capitalized}.sorted()
print("Sorted capitalized planet names: \(sortedCapitalizedPlanetNames)")

//Names flat map sorted descending

let descendingFlatNames = names.flatMap({$0.sorted{$0 > $1}})
print("Descending sorted flat map names: \(descendingFlatNames)")
