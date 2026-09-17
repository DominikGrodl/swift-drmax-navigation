enum BookmarksDestination: Hashable {
    case articleDetail(ArticleDetailModel)
    case sourceDetail(SourceDetailModel)
    case authorDetail(AuthorDetailModel)
}

protocol BookmarksDestinationProviding {
    static func bookmarksDestination(_ : BookmarksDestination) -> Self
}
