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
        
        list.push(value: 12)
        list.push(value: 10)
        list.delete(index: 1)
//        list.append(value: 2)
//        list.append(value: 4)
//        list.append(value: 6)
//        list.append(value: 8)
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
