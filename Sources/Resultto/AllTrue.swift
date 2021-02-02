//  AllTrue.swift
//  1/1/21

import Foundation

@resultBuilder
public struct AllTrue {
    public static func buildBlock(_ elements: Bool...) -> Bool {
        elements.allSatisfy { $0 == true }
    }
    
}
