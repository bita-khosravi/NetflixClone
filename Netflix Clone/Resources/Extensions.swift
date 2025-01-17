//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Ensi Khosravi on 21.11.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
