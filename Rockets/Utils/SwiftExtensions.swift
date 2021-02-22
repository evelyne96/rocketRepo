//
//  SwiftExtensions.swift
//  Rockets
//
//  Created by Suto, Evelyne on 20/02/2021.
//

import Foundation
import SwiftUI

extension DateFormatter {
  static let iso8601: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}

extension Font {
    static var rocketDetailFont: Font {
        return Font.system(size: 14)
    }
    
    static var rocketTitleFont: Font {
        return Font.system(size: 18)
    }
}
