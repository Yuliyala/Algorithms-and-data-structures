//: [Previous](@previous)

import Foundation
//MARK: - Бинарный поиск

//Пример 1

func binarySearch(array: [Int], item: Int) -> Int? {
    
    var low = 0
    var high = array.count - 1
    var mid = 0
    var guess = 0
    
    while low <= high {
        mid = (low + high) / 2
        guess = array[mid]
        
        if guess == item {
            return mid
        } else if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return nil
}

let binaryTestArray = [1, 3, 6, 7, 9, 12, 15, 18]
binarySearch(array: binaryTestArray, item: 7)

//O - описывает скорость работы алгоритма

//O(n)
//O(log n)
//O(n * log n) - эффективный алгоритм

//O(n^2) - медленные алгориты
//O(n!) - очень медленные алгоритмы

//10с

//1 элемент = 1мс
//100 элемент = 100мс

//100 элементов = 7мс
// 100 / 7 = 15 раз

// 1 000 000 000 - 30 мс
//при переборе 1 000 000 000 - 450мс

//1 000 000 000 - 11 дней

func sumOrMulty() {
    
    let testArray = [1, 2, 3, 4, 5, 6]
    
//    for element in testArray {
//        print(element)
//    }
//
//    print("end")
//
//    for index in 0..<testArray.count {
//        print(index)
//    }
    
    for element in testArray {
        for index in 0..<testArray.count {
            print(element, index)
        }
    }
    
    for index in 0..<testArray.count {
        print(index)
    }
}

//sumOrMulty()

/*
 O(n)
 O(n + 1) = O(n)
 O(2n) = O(n)
 O(n^2)
 O(n^2 + n) = O(n^2)
 O(5*2^n + 10*n^100) = O(2^n)
 O(n^2 + B) - пока не знаем как растет B, не может его убрать
 */

//MARK: - Сортировка выбором

//Пример 2

func findMinValue(array: [Int]) -> Int {
    
    var minValue = array[0]
    var minIndex = 0
    
    for index in 0..<array.count {
        if array[index] < minValue {
            minValue = array[index]
            minIndex = index
        }
    }
    return minIndex
}

//findMinValue(array: shuffledTestArray)

func sortArray(array: inout [Int]) -> [Int] {
    
    var sortArray = [Int]()
    
    while array.count != 0 {
        let minValue = findMinValue(array: array)
        sortArray.append(array[minValue])
        array.remove(at: minValue)
    }
    
    return sortArray
}

var shuffledTestArray = [4, 6, 1, 12, 3, 22, 14, 0, -2]
//sortArray(array: &shuffledTestArray) //O(n^2)

//MARK: - Сортировка пузырьком O(n^2)

var number = [4, 6, 1, 12, 3, 22, 14, 0, -2]

func bubbleSort(array: inout [Int]) {
    
    
    for i in 0..<array.count {
        
        let index = array.count - 1 - i
        
        for j in 0..<index {
            let number = array[j]
            let nextNumber = array[j + 1]
            
            if number > nextNumber {
                array[j] = nextNumber
                array[j + 1] = number
            }
        }
    }
    
//    for i in 0..<array.count {
//
//        if i == array.count - 1 { break }
//
//        let number = array[i]
//        let nextNumber = array[i + 1]
//
//        if number > nextNumber {
//            array[i] = nextNumber
//            array[i + 1] = number
//        }
//    }
}

bubbleSort(array: &number)

//MARK: - Метод двойного указателя

//Пример 3

//топот
//А роза Азора

func isPalindrom(numberAsString: String) -> Bool { //O(n)
    let resultString = numberAsString.replacingOccurrences(of: " ", with: "").lowercased()
    let charactersArray = Array(resultString)
    var rightPointer = charactersArray.count - 1
    
    if charactersArray.count == 1 {
        true
    }
    
    for index in 0..<charactersArray.count {
        if charactersArray[index] != charactersArray[rightPointer] {
            return false
        }
        rightPointer -= 1
    }
    return true
}

isPalindrom(numberAsString: "А роза Азора")

let firstArray = [2, 8, 8, 19]
let secondArray = [3, 4, 5, 5, 10, 11, 12]
 
func twoPointers(aArray: [Int], bArray: [Int]) -> [Int] { //O(n)
    
    var a = 0
    var b = 0
    var cArray = [Int]()
    
    while a<aArray.count && b<bArray.count {
        if aArray[a] < bArray[b] {
            cArray.append(aArray[a])
            a += 1
        } else {
            cArray.append(bArray[b])
            b += 1
        }
    }
    
    while a < aArray.count {
        cArray.append(aArray[a])
        a += 1
    }

    while b < bArray.count {
        cArray.append(bArray[b])
        b += 1
    }
    
    return cArray
}

twoPointers(aArray: firstArray, bArray: secondArray)

//MARK: - Скользящее окно

//Пример 4

struct MaxSumRange {
    var maxSum = 0
    var start = 0
    var end = 0
}

func slidingWindow(array: [Int]) -> MaxSumRange? {
    
    //Инициализируем переменные
    var currSum = 0
    var startIndex = 0
    var maxSumRange: MaxSumRange? = nil
    
    //Проходимся по массиву
    for endIndex in 0..<array.count {
        currSum += array[endIndex]
        
        //Если текущая сумма больше максимальной, обновляем границы подмассива и общую сумму
        if maxSumRange == nil || currSum > maxSumRange?.maxSum ?? 0 {
            maxSumRange = MaxSumRange(maxSum: currSum,
                                      start: startIndex,
                                      end: endIndex)
        }
        
        //В какой-то момент может стать так, что сумма станет меньше 0
        //Это означает, что все, что мы сложили ранее имеет отрицательных чисел больше, чем положительных
        //Не имееет смысла прибавлять к отрицательной сумму, т.к. мы получим уменьшенное число/сумму
        if currSum < 0 {
            currSum = 0
            startIndex = endIndex + 1
            
        }
    }
    return maxSumRange
}

let slideWindow = [4, -7, 5, -1, 8]
let result = slidingWindow(array: slideWindow) //O(n)
result?.start
result?.end
result?.maxSum

func fixedSlideWindow(array: [Int], num: Int) -> Int? {
    
    var tempSum = 0
    var maxSum = 0
    
    if array.count < num {
        return nil
    }
    
    for index in 0..<num { //сумма первых num элементов
        maxSum += array[index]
    }
    
    tempSum = maxSum
    
    for index in num..<array.count {
        tempSum = tempSum - array[index - num] + array[index]
        if tempSum > maxSum {
            maxSum = tempSum
        }
    }
    return maxSum
}

let fixedArray = [1, 13, 3, 4, 5, 22, 11, 5]

fixedSlideWindow(array: fixedArray, num: 3) //O(n * M)

//1 + 13 + 3 = 17
//13 + 3 + 4 = 20

//17 - 1 + 4 = 20






