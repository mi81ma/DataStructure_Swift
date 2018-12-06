import UIKit

struct LinkedList<Value> {

    var head :Node<Value>?
    var tail :Node<Value>?

    var isEmpty :Bool {
        return head == nil
    }


    mutating func push(_ value : Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }


    }


    func node(at index:Int) -> Node<Value>? {

        var currentIndex = 0
        var currentNode = head


        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }

    func insert(_ value :Value, after node :Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }

    mutating func append(_ value :Value) {

        guard !isEmpty else {
            push(value)
            return
        }
        let node = Node(value: value)
        tail!.next = node
        tail = node

    }


    mutating func pop() -> Value? {

        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }

        return head?.value
    }

    init() { }
}

extension LinkedList :CustomStringConvertible {

    var description :String {

        guard let head = head else {
            return "Empty List"
        }

        return String(describing: head)
    }
}



class Node<Value> {
    var value :Value
    var next :Node?

    init(value :Value, next :Node? = nil) {

        self.value = value
        self.next = next

    }
}


extension Node :CustomStringConvertible {

    var description :String {

        guard let next = next else {
            return "\(value)"
        }

        return "\(value) ->" + String(describing: next) + " "
    }
}




var list = LinkedList<Int>()


list.append(10)
list.append(3)
list.append(12)
list.append(100)


print("Before popping list")
print(list)

print("After popping list")
list.pop()
print(list)
