//
//  postsView.swift
//  AnonymousNotes
//
//  Created by George TURP on 04/02/2024.
//

import SwiftUI
import Supabase
import Foundation

struct Post: Identifiable {
    let id = UUID()
    var content: String
    var publicationDate: Date
}


struct PostsView: View {
    var post: Post
    @Binding var isExpanded: Bool
    @State private var posts: [Post] = []
    
    func fetchPosts() {
        supabase
            .from("posts")
            .select(columns: "*")
            .order(column: "publication_date", ascending: false)
            .execute { result in
                switch result {
                case .success(let response):
                    if let data = response.data,
                       let decoded = try? JSONDecoder().decode([Post].self, from: data) {
                        DispatchQueue.main.async {
                            self.posts = decoded
                        }
                    }
                case .failure(let error):
                    print("Error fetching posts: \(error.localizedDescription)")
                }
            }
    }
    
    var body: some View {
        // View code
        List(posts) { post in
            Text(post.content)
        }
        .onAppear {
            fetchPosts()
        }
        
        ZStack {
            if isExpanded {
                ScrollView {
                    Text(post.content)
                        .frame(maxWidth: .infinity, alignment: .leading) // Adjust alignment as needed
                        .padding()
                }
                .background(Color.white.opacity(0.9))
                .cornerRadius(16) // Adjust if you want rounded corners
                .shadow(radius: 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 16) // Adjust for consistent design
                        .stroke(Color.white, lineWidth: 2)
                )
                .padding(.horizontal, 16) // Ensure 16px margins on the left and right
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Use the entire screen, minus margins
            } else {
                // Collapsed view configuration
                Text(post.content)
                    .lineLimit(1)
                //.truncationMode(.tail)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.5, height: 180)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(8)
                    .shadow(radius: 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .padding(16)
            }
        }
        .onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
    
    
}


#Preview {
    PostsView(post: Post(content: "Hello", publicationDate: Date()), isExpanded: .constant(true))
}
