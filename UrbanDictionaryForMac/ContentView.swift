//
//  ContentView.swift
//  UrbanDictionaryForMac
//
//  Created by Aaron Lee on 2020-12-08.
//

import SwiftUI

struct ContentView: View {
    
    let width = NSScreen.main!.frame.width
    let height = NSScreen.main!.frame.height
    
    @State private var term: String = ""
    
    @ObservedObject private var viewModel = SearchViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Urban Dictionary for Mac")
                    .font(.system(size: 30, weight: .bold, design: .default))
                
                HStack {
                    TextField("Search by a term...",
                              text: $term, onCommit:  {
                                self.searchByTerm()
                              }
                    )
                    .font(.system(size: 26, weight: .semibold, design: .default))
                    .frame(width: geometry.size.width * 0.6, height: 30)
                    
                    Button(action: {
                        self.searchByTerm()
                    }) {
                        Text("Search")
                            .font(.system(size: 26, weight: .semibold, design: .default))
                    }
                    .frame(height: 30)
                    .buttonStyle(PlainButtonStyle())
                    
                }
                .padding(.top, 30)
                
                Spacer()
                    .frame(height: 30)
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading, spacing: 20) {
                        if let searchByTermResponse = self.viewModel.searchByTermResponse, !searchByTermResponse.isEmpty {
                            ForEach(searchByTermResponse, id: \.id) { result in
                                
                                HStack {
                                    Text("\(result.definition ?? "")")
                                        .font(.system(size: 18, weight: .regular, design: .default))
                                }
                            }
                        } else if let searchByTermResponse = self.viewModel.searchByTermResponse {
                            if searchByTermResponse.isEmpty && self.viewModel.isLoaded {
                                Text("No results.")
                                    .font(.system(size: 18, weight: .regular, design: .default))
                            }
                        } else {
                            Text("Please Search...")
                                .font(.system(size: 18, weight: .regular, design: .default))
                        }
                    }
                }
                .frame(width: geometry.size.width * 0.6)
                
            }
            .padding()
            .frame(width: geometry.size.width, height: geometry.size.height)
            
        }
        .frame(minWidth: width * 0.6, minHeight: height * 0.6)
        .frame(maxWidth: width, maxHeight: height)
    }
    
    private func searchByTerm() {
        let formattedTerm = term.replacingOccurrences(of: " ", with: "")
        
        if formattedTerm.count > 0 && formattedTerm != "" {
            self.viewModel.searchByTerm(term: self.term)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
