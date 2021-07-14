//  StringResult.swift
//  7/14/21

@resultBuilder
public struct StringResult {
    public enum Modifier {
        case joiner(_ joiner: String)
        
    }
    
    public enum Element {
        case substring(_ substring: String)
        case modifier(_ modifier: Modifier)
        
    }
    
    fileprivate struct BuilderRun {
        var joinSeparator = ""
        var components: [String] = []
        
        func render() -> String {
            components.joined(separator: joinSeparator)
        }
        
    }
    
    public static func buildBlock(_ elements: Element...) -> String {
        var runs = [BuilderRun]()
        
        elements.forEach { element in
            switch element {
            case .modifier(let modifier):
                runs.apply(modifier: modifier)
                
            case .substring(let substring):
                runs.append(substring)
                
            }
        }
        
        return runs.render()
    }
    
}

public extension StringResult {
    static func buildExpression(_ substring: String) -> Element {
        return .substring(substring)
    }
    
    static func buildExpression(_ modifier: Modifier) -> Element {
        return .modifier(modifier)
    }
    
}

fileprivate extension Array where Element == StringResult.BuilderRun {
    mutating func apply(modifier: StringResult.Modifier) {
        switch modifier {
        case .joiner(let joiner):
            self.append(Element(joinSeparator: joiner))
            
        }
    }
    
    mutating func append<SP: StringProtocol>(_ substring: SP) {
        let substring = String(substring)
        
        if self.isEmpty {
            self.append(Element(components: [substring]))
            
        } else {
            self.mutableLast.components.append(substring)
            
        }
    }
    
    func render() -> String {
        self.map { $0.render() }
            .joined()
    }
    
}

extension Array {
    private var lastIndex: Index {
        precondition(!isEmpty)
        return endIndex.advanced(by: -1)
    }
    
    var mutableLast: Element! {
        get { last }
        set { self[lastIndex] = newValue }
    }
    
}
