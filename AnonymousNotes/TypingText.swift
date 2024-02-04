//
//  TypingText.swift
//  AnonymousNotes
//
//  Created by George TURP on 04/02/2024.
//

import SwiftUI

struct TypingText: View {
    
    // Updated fullText with the new content
    let fullText: String = "Anonymous notes. Open yourself up, share your stories and discover others from all over the world."
    
    // State to hold the currently displayed portion of the text
    @State private var displayedText: String = ""
    
    @State private var typingCompleted: Bool = false
    
    // State to manage the animation timer
    @State private var timer: Timer?
    
    // This will be used to inform the parent view
    @Binding var animationCompleted: Bool
    

    var body: some View {
    
        
        // Dynamically size the text to fill the width of the screen
        Text(displayedText)
            .font(.custom("ClashDisplay-Bold", size: UIScreen.main.bounds.width / CGFloat(fullText.count / 14))) // Adjust the divisor to control the font size
            
            .multilineTextAlignment(.leading) // Left align the text
            .lineLimit(nil) // Allow unlimited lines for text wrapping
            .foregroundColor(.white.opacity(0.6))
            .padding(.horizontal, 0) // Add padding to ensure text does not touch the edges of the screen
            .onAppear {
                startTypingAnimation()
            }
        
        if typingCompleted {
                        // Placeholder for additional content that appears after typing completes
                        // This could be another text view, an image, or any other view
                        Text("Additional content goes here.")
                }
        
        
    }

    func startTypingAnimation() {
        let characters = Array(fullText)
        var index = 0
        let interval = 10.0 / Double(characters.count) // Calculate the interval to evenly spread out the typing effect over 4 seconds
        
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            displayedText.append(characters[index])
            
            index += 1
            if index >= characters.count {
                timer.invalidate() // Stop the timer when all characters are displayed
            }
        }
    }
        
        func completeTyping() {
            typingCompleted = true
            animationCompleted = true // Inform the parent view
            timer?.invalidate()
        }
    }
    

#Preview {
    TypingText(animationCompleted: .constant(false))
}
