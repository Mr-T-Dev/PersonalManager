//
//  DateParser.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 10/8/22.
//

import Foundation

// swiftlint:disable identifier_name
public enum DateParser: String {
    case ISO861_Timezone = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case yyyy_MM_dd = "yyyy-MM-dd"
    case yyyy_MM_dd_HH_mm = "yyyy-MM-dd HH:mm"
    case yyyy_MM_dd_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
    case dd_MM_yyyy = "dd/MM/yyyy"
    
    public func toString(date: Date) -> String {
        return DateFormatterManager
            .shared
            .toString(self.rawValue, date)
    }
    
    public func toDate(value: String) -> Date? {
        return DateFormatterManager
            .shared
            .toDate(self.rawValue, value)
    }
    
    public func toString(date: Date, dateFormatter: DateFormatter) -> String {
        dateFormatter.dateFormat = self.rawValue
        return dateFormatter.string(from: date)
    }
    
    public func toDate(value: String, dateFormatter: DateFormatter) -> Date? {
        dateFormatter.dateFormat = self.rawValue
        return dateFormatter.date(from: value)
    }
}

private class DateFormatterManager {
    public static let shared: DateFormatterManager = DateFormatterManager()
    
    var dateFormatter: DateFormatter
    var timeDateFormatter: DateFormatter
    
    public var calendar: Calendar { dateFormatter.calendar }
    public var locale: Locale { dateFormatter.locale }

    private let queue: DispatchQueue
    
    init() {
        self.dateFormatter = DateFormatter()
        self.timeDateFormatter = DateFormatter()
        self.timeDateFormatter.locale = Locale(identifier: "en_US")
        
        self.queue = DispatchQueue(label: "DateFormatter Queue", attributes: .concurrent)
    }
    
    public func updateDateFormatter(locale: Locale, calendar: Calendar) {
        self.dateFormatter.locale = locale
        self.dateFormatter.calendar = calendar
    }
    
    func toString(_ format: String, _ date: Date) -> String {
        self.queue.sync(flags: .barrier) {
            self.dateFormatter.dateFormat = format
            return self.dateFormatter.string(from: date)
        }
    }
    
    func toDate(_ format: String, _ value: String) -> Date? {
        self.queue.sync(flags: .barrier) {
            self.dateFormatter.dateFormat = format
            return self.dateFormatter.date(from: value)
        }
    }
}
