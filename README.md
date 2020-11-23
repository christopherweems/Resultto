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
