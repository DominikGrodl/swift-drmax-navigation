public protocol HashableObject: AnyObject, Hashable {}
extension HashableObject {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
