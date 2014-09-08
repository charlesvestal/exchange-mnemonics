// Playground - noun: a place where people can play

import UIKit

var homeRate:Double = 1 // home currency to USD
var awayRate:Double = 21.41 // USD to foreign
var amountToExchange = 113.0

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
    var roundedString = ""
    
    if(exchangeValue < 1)
    {
        let roundedExchangeValue = exchangeValue, Format = String(format:"0.%i", (magnitude * -1))
        roundedString = String("\(roundedExchangeValue.format(Format))")
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


var fakeEchangeMultiplied = amountToExchange * Double(multiplyBy)
var fakeExchangeMovetheDecimal = fakeEchangeMultiplied * pow(10.0, Double(magnitude))

/// output below

println("You're exchanging \(amountToExchange) in foreign")
println(actualTotalString)
println("at an actual exchange rate of \(exchangeRateValue)")

println("The easiest exchange rate is going to be \(roundedExchange)")

println("So multiply times \(multiplyBy), i.e. \(amountToExchange) x \(multiplyBy) = \(fakeEchangeMultiplied),")

if (magnitude==0)
{
    // you're multiplying times a single digit
}
else if(magnitude > 0){
    println("and add \(magnitude) zeroes, i.e. \(fakeExchangeMovetheDecimal)")
}
else {
   println("and move the decimal \(abs(magnitude)) places to the left, i.e. \(fakeExchangeMovetheDecimal)")
}


if (variance > 0.0) {
    println("but the actual total is \(actualTotal), so the real total is about \(varianceString)% less than that,")
    println("So think about everything as that much less than \(roundedExchange)x")
}
else
{
    println("but the actual total is \(actualTotal), so the real total is about \(varianceString)% more than that")
    println("So think about everything as that much more than \(roundedExchange)x ")
}
