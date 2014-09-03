// Playground - noun: a place where people can play

import UIKit

var homeRate:Double = 10000 // dollars per dollar
var awayRate:Double = 6 // kroner per dollar

func exchangeRate () -> Double {
    var exchangeRate = homeRate / awayRate
    return exchangeRate
}

func exchange(awayAmount:Double) -> Double
{
    var exchanged = awayAmount * exchangeRate()
    return exchanged
}

exchangeRate()

var exchangeString = String(format: "%0.20f", exchangeRate())

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

extension Double {
    func format(f: String) -> String {
        return NSString(format: "%.\(f)f", self)
    }
}

var leadingZerosAfterDecimal = 0
var decimalPosition = 0
var firstSignificantDigitPositionAfterDecimal = 0

var i:Int = 0
var magnitude:Double = 0.0

if (exchangeString[0] != "0")
{
    while(exchangeString[i] != ".") {
        magnitude++
        i++
    }
    firstSignificantDigitPositionAfterDecimal = 0
    magnitude++
}
else
{ // we're below 0
    while(exchangeString[i] == "0" || exchangeString[i] == ".")
    {
        if(exchangeString[i]=="."){
        }
        else{
            firstSignificantDigitPositionAfterDecimal++
        }
        i++
    }
}

leadingZerosAfterDecimal
decimalPosition
firstSignificantDigitPositionAfterDecimal
magnitude = pow(10.0,(magnitude-2.0))




let exchangeRateValue = exchangeRate()

if (exchangeRate() < 1){
    var myString = String(firstSignificantDigitPositionAfterDecimal)
    let myDouble = exchangeRate()
    println(myDouble.format(myString))
}
else{
    var myIntValue:Int = Int(exchangeRate())
    //need to figure out types then i can get the largest multiplier
    //var rounded = magnitude((exchangeRate() + (magnitude / 2.0))/magnitude)
}








