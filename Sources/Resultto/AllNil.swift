//  AllNil.swift
//  11/23/20

@_functionBuilder
public struct AllNil {
    public static func buildBlock(_ elements: Optional<Any>...) -> Bool {
        elements.allSatisfy { $0 == nil }
    }
    
}
