//: Header 使用简单的样式匹配方式

//: [Previous](@previous)



import Foundation
//: 匹配值的方式

let orgin = (x: 0, y: 0)
let pt1 = (x: 0, y: 0);
if pt1.x == orgin.x && pt1.y == orgin.y{
    print("@Origin")
}

if case (0, 0) == pt1 {
    print("@Origin")  
}

switch pt1 {
case (0, 0):
    print("@origin")
case (_, 0):
    print("on x axis")
case (0, _):
    print("on y axis")
case (-1...1, -1...1):
    print("inside 1x1 square")
default:
    break
}


//let array1 = [1, 1, 2, 2, 2]
//
//for case 2 in array1 {
//    print("found two") // Three times
//}
//
//////:2.把匹配的内容绑定到变量
//
//switch pt1 {
//case (let x, 0):
//    print("(\(x), 0) is on x axis")
//case (0, let y):
//    print("(0, \(y)) is on y axis")
//default:
//    break
//}
//
//
//enum Direction {
//    case north, south, east, west(abbr: String)
//}
//
//let west = Direction.west(abbr: "W")
//
//
//if case .west = west {
//    print(west) // west("W")
//}
//
//if case .west(let direction) = west {
//    print(direction) // W
//}
//
////:3.自动提取optional的值
//
//let skills: [String?] =
//    ["Swift", nil, "PHP", "JavaScirpt", nil]
//
//for case let skill? in skills {
//    print(skill) // Swift PHP JavaScript
//}
//
//
////:4.自动绑定类型转换的结果
//
//let someValues: [Any] = [1, 1.0, "One"]
//for value in someValues {
//    switch value {
//    case let v as Int: //判断类型
//        print("Integer \(v)")
//    case let v as Double:
//        print("Double \(v)")
//    case let v as String:
//        print("String \(v)")
//    default:
//        print("Invalid value")
//    }
//}
//// Integer 1
//// Double 1.0
//// String One
//for value in someValues {
//    switch value {
//    case is Int: // 判断类型
//        print("Integer")
//        // omit for simplicity...
//}
//
//: [Next](@next)
