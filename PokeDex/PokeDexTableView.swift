//
//  PokeDexTableView.swift
//  Pokedex
//
//  Created by Caleb Caviness on 10/13/24.
//

import SwiftUI

struct PokeDexTableView: View {
    
    let items: [(String, String)] = [
        ("Row 1 - Column 1", "Row 1 - Column 2"),
        ("Row 2 - Column 1", "Row 2 - Column 2"),
        ("Row 3 - Column 1", "Row 3 - Column 2"),
    ]
    
    var body: some View {
        List(items, id: \.0) { item in
            HStack {
                Text(item.0) // Column 1
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(item.1) // Column 2
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .navigationTitle("Table View")
    }
}

#Preview {
    PokeDexTableView()
}


//Creating a table view with two columns and a variable number of rows in SwiftUI can be achieved using `List` or `Grid`. Below are examples using both methods.
//
//### Example Using `List`
//
//You can create a simple table structure using a `List` with a `HStack` for the two columns:
//
//```swift
//import SwiftUI
//
//struct ContentView: View {
//    // Example data
//    let items: [(String, String)] = [
//        ("Row 1 - Column 1", "Row 1 - Column 2"),
//        ("Row 2 - Column 1", "Row 2 - Column 2"),
//        ("Row 3 - Column 1", "Row 3 - Column 2"),
//    ]
//
//    var body: some View {
//        List(items, id: \.0) { item in
//            HStack {
//                Text(item.0) // Column 1
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                Text(item.1) // Column 2
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
//        }
//        .navigationTitle("Table View")
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//```
//
//### Example Using `Grid`
//
//If you want a more structured grid layout, you can use `Grid`:
//
//```swift
//import SwiftUI
//
//struct ContentView: View {
//    // Example data
//    let items: [(String, String)] = [
//        ("Row 1 - Column 1", "Row 1 - Column 2"),
//        ("Row 2 - Column 1", "Row 2 - Column 2"),
//        ("Row 3 - Column 1", "Row 3 - Column 2"),
//    ]
//
//    var body: some View {
//        VStack {
//            // Header
//            HStack {
//                Text("Column 1")
//                Spacer()
//                Text("Column 2")
//            }
//            .font(.headline)
//            .padding()
//
//            // Grid of items
//            ForEach(items, id: \.0) { item in
//                HStack {
//                    Text(item.0) // Column 1
//                    Spacer()
//                    Text(item.1) // Column 2
//                }
//                .padding()
//            }
//        }
//        .padding()
//        .navigationTitle("Table View")
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//```
//
//### Notes:
//-  Both examples create a two-column layout with a predefined set of rows.
//-  You can modify the `items` array to have any number of rows.
//-  In the `Grid` example, you would typically need to implement additional features like spacing or custom row height for a more advanced layout.
//
//### Running the Code
//To run the code, create a new SwiftUI project in Xcode, replace the content of `ContentView.swift`, and build the project. You'll see a simple table-like view with two columns!
