//
//  NewRecipeViewControllerThree.swift
//  EasyCookApp
//
//  Created by Gabriel Ferreira de Carvalho on 17/09/21.
//
import Combine
import UIKit

class NewRecipeViewControllerThree: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    private var cancellables: Set<AnyCancellable> = .init()
    var formManager: FormManager?
    
    @IBAction func sendRecipe(_ sender: Any) {
        guard let formManager = formManager else {
            return
        }

        formManager.addPreparationMethod(textView.text)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/addRecipe")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try! JSONEncoder().encode(formManager.recipe)
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .map(\.response)
            .map { $0 as? HTTPURLResponse }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: printResult,
                  receiveValue: printResponse)
            .store(in: &cancellables)
    }
    
    private func printResult(_ result: Subscribers.Completion<URLSession.DataTaskPublisher.Failure>) {
        switch result {
        case .failure(let error):
            print(error)
        case .finished:
            print("sucess")
        }

    }
    
    private func printResponse(_ response: HTTPURLResponse?) {
        guard let response = response else {
            print("fudeu")
            return
        }
        dismiss(animated: true, completion: nil)
        print("Response: \(response.statusCode)")
    }
    
}
