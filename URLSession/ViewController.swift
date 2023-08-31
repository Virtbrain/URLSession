//
//  ViewController.swift
//  URLSession
//
//  Created by Alexey Manankov on 31.08.2023.
//

import UIKit

class ViewController: UIViewController {
    let firstRstButton = UIButton()
    let secondrstButton = UIButton()

    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "URLSession"
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        [firstRstButton, secondrstButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .orange
            $0.layer.cornerRadius = 10
            $0.setTitleColor(.black, for: .normal)
            $0.setTitleColor(UIColor(white: 1, alpha: 0.3), for: .highlighted)
        }
        
        NSLayoutConstraint.activate([
            firstRstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            firstRstButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant:  30),
            firstRstButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            firstRstButton.heightAnchor.constraint(equalToConstant: 50),
            
            secondrstButton.topAnchor.constraint(equalTo: firstRstButton.bottomAnchor, constant: 30),
            secondrstButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant:  30),
            secondrstButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            secondrstButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        firstRstButton.setTitle("First Request", for: .normal)
        firstRstButton.addTarget(self, action: #selector(didTapFirstRequest), for: .touchUpInside)
        
        secondrstButton.setTitle("Second Request", for: .normal)
        secondrstButton.addTarget(self, action: #selector(didTapSecondRequest), for: .touchUpInside)
    }
    
    @objc private func didTapFirstRequest() {
        let request = URLRequest(url: URL(string: "https://api.vk.com/method/auth.restore?phone=79999999999")!)
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            print(String(decoding: data!, as: UTF8.self))
            print(response ?? "")
            print(error ?? "")
        }
        
        task.resume()
    }
    
    @objc private func didTapSecondRequest() {
        var request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/Any")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["AuthToken":"null"]
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            print(String(decoding: data!, as: UTF8.self))
        }
        task.resume()
    }

}

