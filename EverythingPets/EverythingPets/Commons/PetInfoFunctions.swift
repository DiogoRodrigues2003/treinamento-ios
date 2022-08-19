
import Foundation

func unknownInfoChecker(info: String?) -> String {
    if info != nil {
        return info!
    } else {
        return Localizable.unknown()
    }
}

func infoFormatter(info: Int?) -> String {
    guard info != nil else {
        return Localizable.unknown()
    }

    if info == 1 {
        return Localizable.yes()
    } else {
        return Localizable.no()
    }
}

func catLifeSpanFormatter(lifeSpan: String?) -> String {
    guard lifeSpan != nil else {
        return Localizable.unknown()
    }
    return lifeSpan! + Localizable.years()
}
