//
//  Button.swift
//  AnonymousNotes
//
//  Created by George TURP on 04/02/2024.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let icon: Image
    let backgroundColor: Color
    let textColor: Color
    let fullWidth: Bool
    
    var body: some View {
        Button(action: {
            // Button action here
        }) {
            HStack {
                Text(title)
                    .bold()
                    .font(.custom("ClashDisplay-Bold", size: 14))
                
                icon
                    .resizable()
                    .frame(width: 15, height: 15)
                
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            .background(backgroundColor.opacity(backgroundColor == .black ? 1 : 0.6))
            .foregroundColor(textColor)
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.white, lineWidth: 2)
            )
            .frame(maxWidth: fullWidth ? .infinity : nil)
        }
        .cornerRadius(100)
        
    }
}

struct buttonView: View {
    var body: some View {
        VStack {
            // Full-width button example
            CustomButton(title: "Full Width Button", icon: Image(systemName: "person.fill"), backgroundColor: .black, textColor: .white, fullWidth: true)
                .padding()
            
            // Content-hugging button example
            CustomButton(title: "Hug Content", icon: Image(systemName: "star.fill"), backgroundColor: .white, textColor: .black, fullWidth: false)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    buttonView()
}
