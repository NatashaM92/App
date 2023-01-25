//
//  Model.swift
//  App
//
//  Created by Наталья Миронова on 24.01.2023.
//


struct QuoteApp: Decodable {
    let quote: Quote
}

struct Quote: Decodable {
    let author: String
    let body: String
}




