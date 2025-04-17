
import Foundation

enum Router: Hashable {
    case onbord2
    case onbord3
    case onbord4
    case main
    case exerciseDetails(ItemViewModel)
    case quiz
    case quizDetails(QuizeItemViewModel)
    case account
    case root
    case tabBarView
}
