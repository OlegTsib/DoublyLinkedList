//
//  ContentView.swift
//  DoublyLinkedList
//
//  Created by Oleg Tsibulevskiy on 02/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    var list = DoublyLinkedList<Int>()
    
    var body: some View {
        
        list.addFirst(value: 2)
        list.addFirst(value: 4)
//        list.addLast(value: 12)
//        list.addLast(value: 10)
        //list.delete(index: 1)
        print(list.current)
        print(list.next)
        print(list.previous)
        print(list.next)
        print(list.current)
        print(list.next)
//        list.addFirst(value: 2)
//        list.addFirst(value: 4)
//        list.addFirst(value: 6)
//        list.addFirst(value: 8)
        list.traverse()
        print("list length = \(list.length)")
        
        return Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
