//
//  ContentView.swift
//  Mizu
//
//  Created by Ali Jaffar on 2023-01-09.
//

import SwiftUI

struct ContentView: View {
    @State private var quotes = ""
    
    var body: some View {
        VStack {
            Text(quotes)
                .navigationTitle(quotes)
                .onAppear(perform: randQuotes)
                .font(.largeTitle.weight(.bold))
                .foregroundColor(Color.white)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
        .accentColor(Color.black)
        .background(Color.red)
}
    
    
    
    func randQuotes(){
        if let startsWordsURL = Bundle.main.url(forResource: "compliments", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startsWordsURL){
                let allWords = startWords.components(separatedBy: "\n")
                quotes = allWords.randomElement() ?? "You're the Best!"
                return
            }
        }
        fatalError("u messed up with the txt file smh")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
