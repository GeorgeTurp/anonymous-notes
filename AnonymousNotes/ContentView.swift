//
//  ContentView.swift
//  AnonymousNotes
//
//  Created by George TURP on 02/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var typingAnimationCompleted = false
    
    var body: some View {
        let backgroundGradient = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255), location: 0.00),
                .init(color: Color(red: 234 / 255, green: 234 / 255, blue: 234 / 255), location: 0.25),
                .init(color: Color(red: 225 / 255, green: 231 / 255, blue: 225 / 255), location: 0.75),
                .init(color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255), location: 1.00)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        
        VStack {
            topSentence()
                .font(.custom("ClashDisplay-Bold", size: 32))
                .foregroundColor(.black)
            
            Spacer()
            
            ZStack {
                
                if typingAnimationCompleted {
                    // Show the next elements after the typing animation has completed
                    // This could be navigating to another view or showing additional content
                    Text("The next elements are now visible.")
                } else {
                    TypingText(animationCompleted: $typingAnimationCompleted)
                  }
                
                VStack{
                    PostsView(post: Post(content: "The day I lost my best friend, the world seemed to stand still. I wandered through our favorite places, each memory a piercing reminder of the laughter we shared. The emptiness felt overwhelming, a void where once was the warmth of companionship. In the quiet, I whispered promises to keep their spirit alive, a vow to never forget the bond we had.", publicationDate: Date()), isExpanded: .constant(false))
                        .rotationEffect(.degrees(-3))
                        .offset(x: -50, y: 164) // Use offset for positioning
                    
                }
                
            }
            
            Spacer()
            
            
            CustomButton(title: "Skip intro", icon: Image("Double_arrow"), backgroundColor: .white.opacity(0.6), textColor: Color(red: 154 / 255, green: 154 / 255, blue: 154 / 255), fullWidth: false)
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity) // Expand to fill screen
        
        .background(
            ZStack {
                backgroundGradient // Apply the gradient background first
                
                // Left Circle
                Circle()
                    .fill(Color(red: 129 / 255, green: 122 / 255, blue: 108 / 255).opacity(0.4)) // Correct color initialization
                    .frame(width: 420, height: 420)
                    .blur(radius: 50) // Adjust the blur radius as desired
                    .offset(x: -150, y: 164) // Use offset for positioning
                
                // Right Circle
                Circle()
                    .fill(Color(red: 81 / 255, green: 106 / 255, blue: 81 / 255).opacity(0.26)) // Correct color initialization
                    .frame(width: 420, height: 420)
                    .blur(radius: 50) // Adjust the blur radius as desired
                    .offset(x: 150, y: -150) // Use offset for positioning
            }
        )
       // .edgesIgnoringSafeArea(.all) // Ignore safe area to extend to screen edges
    }
}

#Preview {
    ContentView()
}
