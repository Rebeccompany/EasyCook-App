//
//  LoginView.swift
//  EasyCookApp
//
//  Created by Gabriel Ferreira de Carvalho on 05/11/21.
//

import SwiftUI

struct LoginData: Codable {
    let login: String
    let password: String
}

struct LoginView: View {
    @State var login: String = ""
    @State var password: String = ""
    var httpRequest: URLRequest {
        var request = URLRequest(url: URL(string: "http://localhost:3000/login")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(LoginData(login: login, password: password))
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") 
        return request
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Login", text: $login)
                SecureField("Senha", text: $password)
            }
            Button("Log In") {
                Task {
                    do {
                        let (data, response) = try await URLSession.shared.data(for: httpRequest)
                        
                        let decodedData = try JSONDecoder().decode(Bool.self, from: data)
                        
                        if decodedData {
                            NotificationCenter.default.post(name: .init(rawValue: "canDismiss"), object: nil)
                        }
                    } catch  {
                        
                    }
                }
            }

            .padding()
            
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
