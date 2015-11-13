// calls the replacement method in the category NSBundle+FallbackLanguage
public func localizedStringWithFallback(key: String, comment: String) -> String {
    let retVal = NSBundle.mainBundle().localizedStringForKey(key, replaceValue: comment)
    return retVal
}

// if calling NSLocalizedString from within a non-NSObject
// the non-NSObject should conform to FallbackLanguage
protocol FallbackLanguage: class {}

extension FallbackLanguage {
    func NSLocalizedString(key: String, comment: String) -> String {
        return localizedStringWithFallback(key, comment: comment)
    }
}

// if calling NSLocalizedString from within an NSObject, this works
extension NSObject {
    func NSLocalizedString(key: String, comment: String) -> String {
        return localizedStringWithFallback(key, comment: comment)
    }
}
