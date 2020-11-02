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
    private var selected: LinkedListNode?
    
    private(set) var length = 0
    
    var current: Value? {
        return selected?.value
    }
    
    var next: Value? {
        let returnValue = selected?.next?.value
        selected = selected?.next
        return returnValue
    }
    
    var previous: Value? {
        let returnValue = selected?.previous?.value
        selected = selected?.previous
        return returnValue
    }

    func addLast(value: Value) {
        
        let newNode = LinkedListNode(value: value)
        length += 1
        
        if head == nil {
            head = newNode
            tail = newNode
            selected = newNode
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
    
    func addFirst(value: Value) {
        
        let newNode = LinkedListNode(value: value)
        length += 1
        
        if head == nil {
            head = newNode
            tail = newNode
            selected = newNode
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
        
        //Clear
        if length == 1 && counter == 0 {
            head = nil
            tail = nil
            length -= 1
            return
        }
        
        //Delete head
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
    
    func insert(value: Value, to index: Int) {
        
        guard index < length else { return }
        
        let newNode = LinkedListNode(value: value)
        length += 1
        
        var counter = 0
        var nodeToMove = head
        
        while counter < index {
            counter += 1
            nodeToMove = nodeToMove?.next
        }
        
        if index == 0 {
            addFirst(value: value)
            return
        }
        
        newNode.previous = nodeToMove?.previous
        newNode.next = nodeToMove
        
        nodeToMove?.previous?.next = newNode
        nodeToMove?.previous = newNode
    }
    
    func value(for index: Int) -> Value? {
        guard index < length else { return nil }
        
        var counter = 0
        
        var node = head
        
        while counter < index {
            counter += 1
            node = node?.next
        }
        
        return node?.value
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
