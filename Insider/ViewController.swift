//
//  ViewController.swift
//  Insider
//
//  Created by Ozgun SIMSEK on 6.08.2022.
//

import UIKit
import WebKit
import Star

final class ViewController: UIViewController {
    
    // MARK: Private properties
    
    private var buttonSize = CGSize(width: 150, height: 50)
    
    private var webView: WKWebView = {
        let w = WKWebView()
        w.translatesAutoresizingMaskIntoConstraints = false
        return w
    }()
    
    private lazy var smallStar: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Small Star", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleSmallStar), for: .touchUpInside)
        return btn
    }()
    
    private lazy var bigStar: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Big Star", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleBigStar), for: .touchUpInside)
        return btn
    }()

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        loadWebView()
    }
    
    // MARK: Private functions
    
    private func addViews() {
        view.addSubview(webView)
        view.addSubview(smallStar)
        view.addSubview(bigStar)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            smallStar.leftAnchor.constraint(equalTo: webView.leftAnchor),
            smallStar.bottomAnchor.constraint(equalTo: webView.bottomAnchor),
            smallStar.widthAnchor.constraint(equalToConstant: buttonSize.width),
            smallStar.heightAnchor.constraint(equalToConstant: buttonSize.height),
            
            
            bigStar.rightAnchor.constraint(equalTo: webView.rightAnchor),
            bigStar.bottomAnchor.constraint(equalTo: webView.bottomAnchor),
            bigStar.widthAnchor.constraint(equalToConstant: buttonSize.width),
            bigStar.heightAnchor.constraint(equalToConstant: buttonSize.height),
        ])
        
    }
    
    
    private func loadWebView() {
        guard let url = URL(string: "https://img.etimg.com/thumb/msid-72948091,width-650,imgsize-95069,,resizemode-4,qualit%20y-100/star_istock.jpg") else { return }
        webView.load(URLRequest(url: url))
    }
    
    @objc private func handleSmallStar() {
        StarManager.shared.addStarInterface(type: .small)
    }
    
    @objc private func handleBigStar() {
        StarManager.shared.addStarInterface(type: .big)
    }
    
}
