//
//  StarBuilder.swift
//  Star
//
//  Created by Ozgun SIMSEK on 6.08.2022.
//

import Foundation

final class StartBuilder {
    static func createSmallStar() -> StarModel? {
        guard let color = ["Red", "Blue", "Green"].randomElement() else { return nil }
        guard let brightness = ["Bright", "Not so much"].randomElement() else { return nil }
        let star = StarModel(size: "S", color: color, brightness: brightness)
        return star
    }
    
    static func createBigStar() -> StarModel? {
        guard let color = ["Yellow", "Purple", "Gray"].randomElement() else { return nil }
        guard let brightness = ["Bright", "Not so much"].randomElement() else { return nil }
        let star = StarModel(size: "B", color: color, brightness: brightness)
        return star
    }
}
