//
//  DoublyLinkedListTests.swift
//  DoublyLinkedListTests
//
//  Created by Oleg Tsibulevskiy on 02/11/2020.
//

import XCTest
@testable import DoublyLinkedList

class DoublyLinkedListTests: XCTestCase {

    var list: DoublyLinkedList<Int>!
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        list = nil
        super.tearDown()
    }
    
    func testAddFirst() {
        list = DoublyLinkedList<Int>()
        list.addFirst(value: 2)
        list.addFirst(value: 1)
        let values = list.values

        XCTAssertEqual(values, [1,2])
    }
    
    func testAddLast() {
        list = DoublyLinkedList<Int>()
        list.addLast(value: 1)
        list.addLast(value: 2)
        let values = list.values

        XCTAssertEqual(values, [1,2])
    }
    
    func testDelete() {
        list = DoublyLinkedList<Int>()
        list.addLast(value: 1)
        list.addLast(value: 2)
        list.delete(index: 1)
        let values = list.values

        XCTAssertEqual(values, [1])
    }
    
    func testInsert() {
        list = DoublyLinkedList<Int>()
        list.addLast(value: 1)
        list.addLast(value: 3)
        list.insert(value: 2, to: 1)
        let values = list.values

        XCTAssertEqual(values, [1,2,3])
    }
    
    func testValueAtIndex() {
        list = DoublyLinkedList<Int>()
        list.addLast(value: 1)
        list.addLast(value: 3)
        
        XCTAssertEqual(list.value(at: 1), 3)
    }
    
    func testCurrent() {
        list = DoublyLinkedList<Int>()
        list.addLast(value: 1)
        
        XCTAssertEqual(list.current, 1)
    }
    
    func testNext() {
        list = DoublyLinkedList<Int>()
        list.addLast(value: 1)
        list.addLast(value: 3)
        
        XCTAssertEqual(list.next, 3)
    }
    
    func testPrevious() {
        list = DoublyLinkedList<Int>()
        list.addLast(value: 1)
        list.addLast(value: 3)
        _=list.next
        XCTAssertEqual(list.previous, 1)
    }
}
