# Resultto

A collection of handy result builders.

Requires Swift 5.3+ (and Swift 5.4 upon release)


## AllNil

Returns `true` if all elements are nil. 
Elements are not required to be homogenous.

```swift
struct Element {
    var title: String?
    var description: String?
    var child: Self?
    
    @AllNil var isEmpty: Bool {
        title
        description
        child
        
    }
    
}

```

## SingleResult

Returns a single element. Useful to avoid typing a few `return` keywords.

```swift
extension Bool {
    @SingleResult var enEspanol: Bool {
        switch self {
            case true: "Sí"
            case false: "No""
        }
    }
    
}

```


## UUIDResult

Convienence formatter for specifying UUID properties

```swift
protocol UUIDIdentifiable: Identifiable where ID == UUID {
    @UUIDResult var id: UUID { get }
    
}

struct Element: UUIDIdentifiable {
    var id: UUID {
        (194, 210, 39, 207, 170, 13, 68, 151, 190, 189, 41, 237, 240, 95, 174, 248)
    }
    
}

```
