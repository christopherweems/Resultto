//  AllTrue.swift
//  1/1/21

@resultBuilder
public struct AllTrue {
    public static func buildBlock(_ elements: Bool...) -> Bool {
        elements.allSatisfy { $0 == true }
    }
    
}
