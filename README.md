# Resultto

### [Public Archive]
**Now incorporated within the [unstandard](https://github.com/christopherweems/unstandard.git) library.**

---

A collection of handy result builders.

Foundation not required for most builder types.
Requires Swift 5.4+


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

## Count

Total of `true` boolean values 

```swift
struct FooBar {
    var foo: Int?
    var bar: Bool?
    
    @Count var nonOptionalCount: Int {
        foo != nil
        bar != nil
        
    }
    
}

```

## SetResult

Avoid some punctuation while building Set properties.

```swift
struct FooBar {
    var foo: Int
    var bar: Int
    
    @SetResult var fooAndBar: Set<Int> {
        foo
        bar
        
    }
    
}

```

## SingleResult

Returns a single element. Useful to avoid typing a few `return` keywords.

```swift
extension Bool {
    @SingleResult var enEspañol: String {
        switch self {
            case true: "Sí"
            case false: "No""
        }
    }
    
}

```


## UUIDResult

Convienence formatter for specifying UUID properties.
(Requires Foundation)

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

## URLResult

Convienence formatter to specify URLs by strings for urls you know to be valid. 
URL strings are unsafely unwrapped.
(Requires Foundation)

```swift
protocol Website {
    @URLResult var url: URL
    
}

struct Wikipedia: Website {
    var url: URL {
        "https://wikipedia.org"
    }
    
}

```
