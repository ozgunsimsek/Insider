//
//  StarManager.swift
//  Star
//
//  Created by Ozgun SIMSEK on 6.08.2022.
//

import Foundation
import UIKit

public final class StarManager {
    
    public static let shared = StarManager()
    
    private init () {}
    
    private var starArray = [StarModel]()
    
    public func addStarInterface(type: StarType) {
        switch type {
        case .small:
            appendStar(star: StartBuilder.createSmallStar())
        case .big:
            appendStar(star: StartBuilder.createBigStar())
        }
    }
    
    private func appendStar(star: StarModel?) {
        guard let star = star else { return }
        if starArray.count > 10 {
            promptAlert()
        } else {
            starArray.append(star)
        }
        printStatus()
    }
    
    
    private func printStatus() {
        print(starArray)
        let count = starArray.filter{$0.brightness == "Bright"}.count
        print(count)
    }
    
    private func promptAlert() {
        let alertController = UIAlertController(title: nil, message: "Sky is full", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
       
        
        UIApplication.shared.visibleViewController?.present(alertController, animated: true)
    }
    
}
