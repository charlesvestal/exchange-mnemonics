// Playground - noun: a place where people can play

import UIKit


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

var homeRate:Double = 1 // dollars per dollar
var awayRate:Double = 6 // kroner per dollar

func exchangeRate() -> Double {
    var exchangeRate = homeRate / awayRate
    return exchangeRate
}



var exchangeString = String(format: "%0.20f", exchangeRate())

var firstSignificantDigitPositionAfterDecimal = 0
var magnitude = 0.0

var i:Int = 0
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

magnitude = pow(10.0,(magnitude-2.0))
var exchangeRateInt:Int = Int(exchangeRate())
var magnitudeInt:Int = Int(magnitude)


func roundedExchangeRate(Double) -> Double
{
if (exchangeRate() < 1){
        var myString = String(firstSignificantDigitPositionAfterDecimal)
        var myDouble = exchangeRate()
        var roundedExchangeString = NSString(string: myDouble.format(myString))
        return roundedExchangeString.doubleValue //return
    }
else{
        var myIntValue = exchangeRate()
        var roundedExchange = (magnitudeInt*((exchangeRateInt + (magnitudeInt/2))/magnitudeInt))
        return Double(roundedExchange)
    }
}

var multiplyBy: Int = Int(roundedExchangeRate(exchangeRate()) * pow(10.0, Double(firstSignificantDigitPositionAfterDecimal)))
var variance =  (1 - (exchangeRate() / roundedExchangeRate(exchangeRate()))) * 100

var varianceString = String(format:"%0.f", variance)

println("The easiest exchange rate is going to be \(roundedExchangeRate(exchangeRate()))")
println("So multiply by \(multiplyBy)")
println("then move the decimal over \(firstSignificantDigitPositionAfterDecimal) places")
println("(It's actually about \(varianceString) percent less, so think about it as a little less back home in your head)")



