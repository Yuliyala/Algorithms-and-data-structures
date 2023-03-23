import Foundation


import Foundation


func sum(number: Int) -> Int {

    if number == 1{
        return 1
    } else {
     return number + sum(number: number - 1)
    }
}

func sum1 (number: Int) -> Int {
    var sum = 0
    for i in 0...number {
        sum += i
    }
    return sum
}
   
sum1(number: 5)

sum(number: 5)


func factorial(number: Int) -> Int {
    
    if number == 1 {
       return 1
    } else {
        return number * factorial(number: number-1)
    }
}

factorial(number: 3)


// Возвратить n-ный член последовательности Фибоначчи

func fib1(n: Int) -> Int {
    var number1 = 1
    var number2 = 1
    
    for _ in 0..<n-2 {
        let number = number1 + number2
        number1 = number2
        number2 = number
    }
    return number2
}

fib1(n: 4 )

func fib2(n: Int) -> Int {
    guard n > 1 else { return n }
    return fib2(n: n-1) + fib2(n: n-2)
}

fib2(n: 7)

func fib3(n: Int) -> Int {
    return n > 1 ? (fib3(n: n-1) + fib3(n: n-2)) : n
}

fib3(n: 7)


func timeMeasureRunningCode(title: String, operationBlock: () -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operationBlock()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Tome for \(title): \(timeElapsed) seconds")
}

timeMeasureRunningCode(title: "Fib1") {
    fib1(n: 10)
}

timeMeasureRunningCode(title: "Fib2") {
    fib2(n: 10)
}

timeMeasureRunningCode(title: "Fib3") {
    fib3(n: 10)
}
