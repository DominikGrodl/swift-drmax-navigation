import CasePaths
import DrMaxNavigation

@CasePathable
enum Destination: Hashable, CaseEquatable {
    case one, two, three, four
    case child(ChildDestination)
}

@CasePathable
enum ChildDestination {
    case childOne, childTwo, childThree, childFour
}
