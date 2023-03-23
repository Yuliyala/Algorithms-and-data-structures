//: [Previous](@previous)
import Foundation

//Структуры данных

//MARK: - Массивы

//Чтение   сложность - О(1)
//Вставка  сложность - О(n)   append - O(1) подставляем в конец,   insert - по индексу O(n)
//Удаление   сложность - О(n)  Если последний объект О(1) если по индексу  О(n)


// Пример 1 -  Найти второй минимальный элемент в массиве.

let shuffledArray = [ 12, 3, 3, 5, 34, 42, 14, 2, 6, 44 ]

func findSecondMinValue (array: [Int]) -> Int? {
    var minValue = Int.max
    var secondMinValue = Int.max
    
    for index in 0..<array.count {  // 5
        
        if array[index] < minValue {
            secondMinValue = minValue //  secondMinValue = 12
          minValue = array[index] //   minValue = 3
        } else if array[index] <  secondMinValue && array[index] != minValue { //
            secondMinValue = array[index]
        }
    }
    
    if secondMinValue != Int.max {
        print("Second min value \(secondMinValue)")
        return secondMinValue
    } else {
        print("Second min value not found")
        return nil
    }
}

findSecondMinValue (array: shuffledArray)


// Пример 2 : Найти первое неповторяющееся число в массиве
// О(n^2)

let numbers = [ 1, 2, 4, 5, 4, 1 ]

for i in 0..<numbers.count{
    var count = 0
    
    for j in i + 1..<numbers.count {
        if numbers[i] == numbers[j] {
            count += 1
            break
        }
    }
    
    if count == 0 {
        print(numbers[i])
        break
    }
}

// Пример 3 - Удалить дубликаты из отсортированного массива

var numbersArray = [0, 0, 0, 1, 2, 2, 3, 4, 5, 5, 5, 6]

func removeDublicates(array: inout[Int]) -> Int {
    var last: Int?
    var index = 0
    
    while index < array.count {
        if array[index] == last {
            array.remove(at:  index)
        } else {
            last = array[index]
            index += 1
        }
    }
    
    return array.count
}
removeDublicates(array: &numbersArray)


//MARK: - Связные списки

struct LinkedList<T> {
    var head: LinkedListNode<T>
    
    init(head: LinkedListNode<T>) {
    self.head = head
    }
}

indirect enum LinkedListNode<T> {
    case value(element: T , next: LinkedListNode<T>)
    case end
}

let elementFourth = LinkedListNode.value(element: "4" , next: .end)
let elementThird = LinkedListNode.value(element: "3" , next: elementFourth)
let elementSecond = LinkedListNode.value(element: "2" , next: elementThird )
let elementFirst = LinkedListNode.value(element: "1" , next: elementSecond)

//
//let list = LinkedList(head: elementFirst)
//
//extension LinkedList: Sequence {
//    func makeIterator() -> some IteratorProtocol {
//
//    }
//}
//
//struct LinkedListIterator<T>: IteratorProtocol{
//
//}


func calcul() -> Int {
    var sum = 0
    

    for i in 1...365 {
            sum += i
    }
    return sum
}
calcul()
//Задача: перевернуть Linked List
// 3 -> 6 -> 8 -> 21 -> nil
class ListNode {
    var value: Int
    var next: ListNode?
    init(value: Int, next: ListNode?){
        self.value = value
        self.next = next
    }
}
let thirdNode = ListNode(value: 2, next: nil)
let secondNode = ListNode(value: 4, next: thirdNode)
let oneNode = ListNode(value: 3, next: secondNode)

//распечатать
func printList(head: ListNode?) {
    var currentNode = head
    while currentNode != nil {
        print(currentNode?.value ?? "-1")
        currentNode = currentNode?.next
    }
}

printList(head: oneNode)

func reverseList(head: ListNode?) -> ListNode? {
    var currentNode = head
    var prev: ListNode?
    var next: ListNode?
    
    while currentNode != nil {
        next = currentNode?.next
        currentNode?.next = prev
        prev = currentNode
        currentNode = next
    }
    return prev
  
}

reverseList(head: oneNode)
printList(head: reverseList(head: oneNode))


//Пример 6  - Двунапрвленный связный список

class SecondListNode {
    var value: Int
    var next: SecondListNode?
    var previos: SecondListNode?
    
    init(value: Int) {
        self.value = value
    }
}

struct SecondLinkedList {
    
    private var head: SecondListNode?
    private var tail: SecondListNode?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: SecondListNode? {
        head
    }
    
    var last: SecondListNode? {
        tail
    }
    
    mutating func append(value: Int) {
        let newNode = SecondListNode(value: value)
        
        if tail != nil {
            newNode.previos = tail
            tail?.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    mutating func remove(node: SecondListNode) -> Int {
        
        let prev = node.previos
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previos = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previos = nil
        node.next = nil
        
        return node.value
    }
}
//распечатать
func printNode(head: SecondListNode?) {
    var currentNode = head
    while currentNode != nil {
        print(currentNode?.value ?? "-1")
        currentNode = currentNode?.next
    }
}

var list = SecondLinkedList()
list.append(value: 1)
list.append(value: 2)
list.append(value: 3)
list.remove(node: list.first!.next!)
printNode(head: list.first!)

//nil -> Head -> elem2 -> elem3 -> Tail -> nil
