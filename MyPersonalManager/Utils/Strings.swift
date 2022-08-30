//
//  Strings.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 10/8/22.
//

import Foundation

public enum Strings {
    case genericError
    
    var translated: String {
        switch self {
        case .genericError:
            return "Something went wrong"
        }
    }
}
