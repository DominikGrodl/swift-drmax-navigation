import CasePaths

@CasePathable
enum FeedDestination: Hashable {
    case articleDetail(ArticleDetailModel)
    case authorDetail(AuthorDetailModel)
    case sourceDetail(SourceDetailModel)
}

protocol FeedDestinationProviding {
    static func feed(_ destination: FeedDestination) -> Self
}
