//
//  topSentence.swift
//  AnonymousNotes
//
//  Created by George TURP on 04/02/2024.
//

import SwiftUI

struct topSentence: View {
    // Array of possible text contents
    let textOptions = ["Hello, World!", "Welcome to SwiftUI!", "Random Text Here", "Explore SwiftUI", "SwiftUI is Awesome!"]
    
    // State variable to hold the currently selected text
    @State private var currentText: String
    
    // Initialize with a random text
    init() {
        _currentText = State(initialValue: textOptions.randomElement() ?? "Default Text")
    }
    
    var body: some View {
        Text(currentText)
            .font(.custom("ClashDisplay-Bold", size: 16))
            .padding()
            .onAppear {
                // Change the text randomly every time the view appears
                currentText = textOptions.randomElement() ?? "Default Text"
            }
    }
}

struct sentenceView: View {
    var body: some View {
        topSentence() // Use the custom view
    }
}

#Preview {
    topSentence()
}
