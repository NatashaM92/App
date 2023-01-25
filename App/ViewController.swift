//
//  ViewController.swift
//  App
//
//  Created by Наталья Миронова on 22.01.2023.
//

import UIKit

enum Link: String {
    case quoteURL = "https://favqs.com/api/qotd"
}
    
class ViewController: UIViewController {
    
    @IBOutlet var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQuote()
    }
    
    @IBAction func quoteButton() {
        fetchQuote()
    }
}

extension ViewController {
    
    private func fetchQuote() {
        
        guard let url = URL(string: Link.quoteURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let quoteApp = try JSONDecoder().decode(QuoteApp.self, from: data)
                print(quoteApp)
                DispatchQueue.main.async {
                    self?.quoteLabel.text = "Quote: \(quoteApp.quote.body)\n\nAuthor: \(quoteApp.quote.author)"
                }
            } catch let error {
                print(error)
            }
        } . resume()
    }
}


