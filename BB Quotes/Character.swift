//
//  Character.swift
//  BB Quotes
//
//  Created by Ankit Kumar on 18/05/24.
//

import Foundation

struct Character: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let portrayedBy: String
}
