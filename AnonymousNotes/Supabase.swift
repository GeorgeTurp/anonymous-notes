//
//  Supabase.swift
//  AnonymousNotes
//
//  Created by George TURP on 04/02/2024.
//

import SwiftUI
import Supabase

let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://ktjcrokxtobjzowkvacw.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt0amNyb2t4dG9ianpvd2t2YWN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcwNDg4OTksImV4cCI6MjAyMjYyNDg5OX0.P9XkZWrl-UdrRw7gu68gy7H_TwsDvcOrONE2v7X6Ohg",
    options: SupabaseClientOptions(
        db: .init(
            schema: "public"
        )
        
    )
)
