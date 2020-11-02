//
//  DoublyLinkedList.swift
//  DoublyLinkedLists
//
//  Created by Oleg Tsibulevskiy on 31/10/2020.
//

import Foundation

class DoublyLinkedList<Value> {
    
    private var head: LinkedListNode?
    private var tail: LinkedListNode?
    
    var length = 0
    
    func traverse() {
        
        var next: LinkedListNode?
        next = head

        while next != nil {
            print(next!.value)
            next = next?.next
        }
    }
    
    func reverse() {
        
        var previous: LinkedListNode?
        previous = tail

        while previous != nil {
            print(previous!.value)
            previous = previous?.previous
        }
    }

    func addFirst(value: Value) {
        
        let newNode = LinkedListNode(value: value)
        length += 1
        
        if head == nil {
            head = newNode
            tail = newNode
            return
        }
        
        newNode.previous = tail
        tail?.next = newNode

//        var lastNode = head
//
//        while lastNode?.next != nil {
//            lastNode = lastNode?.next;
//        }
//
//        lastNode?.next = newNode
//        newNode.previous = lastNode
        tail = newNode
    }
    
    func addLast(value: Value) {
        
        let newNode = LinkedListNode(value: value)
        length += 1
        
        if head == nil {
            head = newNode
            tail = newNode
            return
        }
        
        newNode.next = head
        head?.previous = newNode
        head = newNode
    }
    
    func delete(index: Int) {
        guard length >= index else { return }
        
        var counter = 0
        var nodeToDelete = head
        
        while counter < index {
            counter += 1
            nodeToDelete = nodeToDelete?.next
        }
        
        if length == 1 && counter == 0 {
            head = nil
            tail = nil
            length -= 1
            return
        }
        
        if length > 1 && counter == 0 {
            head = nodeToDelete?.next
            length -= 1
            return
        }
        
        if nodeToDelete != nil {
            length -= 1
        }
        
        if nodeToDelete?.next != nil {
            nodeToDelete?.next?.previous = nodeToDelete?.previous
        }
        
        if nodeToDelete?.previous != nil {
            nodeToDelete?.previous?.next = nodeToDelete?.next
        }
    }
}

extension DoublyLinkedList {
    
    class LinkedListNode {
        
        var value: Value
        var next: LinkedListNode?
        var previous: LinkedListNode?
        
        init(value: Value, next: LinkedListNode? = nil, previous: LinkedListNode? = nil) {
            self.value = value
            self.next = next
            self.previous = previous
        }
    }
}
