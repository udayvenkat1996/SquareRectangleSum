//
//  ContentView.swift
//  SquareRectangleSum
//
//  Created by Uday Venkat on 27/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfShapes: Int = 4 // Variable to control the number of shapes
    
    var body: some View {
        RecursiveShape(level: 0, totalLevels: numberOfShapes)
            .stroke(Color.black, lineWidth: 1)
            .frame(width: 300, height: 300)
            .background(Color.white)
            .onTapGesture {
                // Toggle between 4 and 8 shapes for demonstration
                numberOfShapes = numberOfShapes == 4 ? 8 : 4
            }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
