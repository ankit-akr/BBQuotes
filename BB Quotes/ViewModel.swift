//
//  ViewModel.swift
//  BB Quotes
//
//  Created by Ankit Kumar on 19/05/24.
//

import Foundation


@MainActor
class ViewModel: ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success(data: (quote: Quote, character: Character))
        case failure(error: Error)
    }
    
    @Published private(set) var status: Status = .notStarted
    
    
    private let controller: FetchController
    
    init(controller: FetchController) {
        self.controller = controller
    }
    
    func getData(for show: String) async {
        status = .fetching
        
        do {
            
            let quote = try await controller.fetchQuote(from: show)
            let character = try await controller.fetchCharacter(quote.character)
            
            status = .success(data: (quote: quote, character: character))
            
        } catch {
            status = .failure(error: error)
        }
        
        
    }
}
