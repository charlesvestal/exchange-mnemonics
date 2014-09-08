// Playground - noun: a place where people can play

import UIKit

var homeRate:Double = 7 // dollars per dollar
var awayRate:Double = 6 // kroner per dollar
var amountToExchange = 96.0


extension String {
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
    
    subscript (r: Range<Int>) -> String {
        var start = advance(startIndex, r.startIndex)
            var end = advance(startIndex, r.endIndex)
            return substringWithRange(Range(start: start, end: end))
    }
}

extension Int {
    func format(f: String) -> String {
        return NSString(format: "%\(f)d", self)
    }
}

extension Double {
    func format(f: String) -> String {
        return NSString(format: "%.\(f)f", self)
    }
}

func exchangeRate() -> Double {
    var exchangeRate = homeRate / awayRate
    return exchangeRate
}

func exchange(amount:Double) -> Double {
    return amount * exchangeRateValue
}

var exchangeRateValue = exchangeRate()

var magnitude = Int(floor(log10(exchangeRateValue)))

func roundedExchangeRate(exchangeValue:Double) -> String {
    
    let magnitudeString: String = String(format:"%i", magnitude)
    var roundedString:String = ""
    
    if(exchangeValue < 1)
    {
        let someDouble = exchangeValue, someDoubleFormat = String(format:"0.%i", (magnitude * -1))
        roundedString = String("\(someDouble.format(someDoubleFormat))")
    }
    else
    {
        let mupltiplier = pow(10.0, Double(magnitude))
        let roundedExchange = Int(mupltiplier) * lround(exchangeValue / mupltiplier)
        roundedString = String(format:"%i", roundedExchange)
    }
    return roundedString
}



var actualTotal = exchange(amountToExchange)
var roundedExchange = roundedExchangeRate(exchangeRateValue)

var roundedExchangeDoubleValue = Float((roundedExchange as NSString).doubleValue)
var variance =  (1.0 - exchangeRateValue / Double(roundedExchangeDoubleValue)) * 100
var varianceString = NSString(format:"%0.f", abs(variance))
var multiplyBy:Int = Int((roundedExchangeDoubleValue / pow(10.0, Float(magnitude)))) // need to get multiply by working
var actualTotalString = String(format:"Your actual total is %.2f in local", actualTotal)


















println("You're exchanging \(amountToExchange) in foreign")
println(actualTotalString)
println("at an actual exchange rate of \(exchangeRateValue)")

println("The easiest exchange rate is going to be \(roundedExchange)")

println("So multiply times \(multiplyBy)")

if(magnitude > 0){
    println("and add \(magnitude) zeroes")
}
else {
   println("and move the decimal \(abs(magnitude)) places to the left")
}

if (variance > 0.0) {
println("but it's really about \(varianceString)% less than in that")
}
else
{
    println("but it's really about \(varianceString)% more than in that")
}
