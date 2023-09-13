//
//  Extensions.swift
//  Matinee
//
//  Created by Murat Akdal on 11.08.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
