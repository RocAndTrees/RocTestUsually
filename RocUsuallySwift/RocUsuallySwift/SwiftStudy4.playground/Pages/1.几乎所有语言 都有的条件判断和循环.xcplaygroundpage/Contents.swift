//: Playground - noun: a place where people can play

//: 4.为代码的执行做个决定

//:@1 head 几乎所有语言 都有的条件判断和循环


import UIKit

/**



//: 1.条件分支判断语句

var light = "red"
var action = ""

if light == "red" {
    action = "stop"
}
else if light == "yellow" {
    action = "caution"
}
else if light == "green" {
    action = "go"
}
else {
    action == "invalid"
}


switch light {
    case "red":
        action = "stop"
    case "yellow":
        action = "caution"
    case "green":
        action = "gp"
    default:
        action = "invalid"
}

//: 2.循环控制语句

let vowel = ["a", "e", "i", "o", "u"]

for char in vowel {
//    print(char)
}
//aeiou

for number in i...10 {
//    print(number)
}
// 12345678910

// DO NOT use this style of for loop in swift 3.0
// for var i = 0; i < 10; i += 1 {
//    print(i)
// }


// while

var i  = 0
while i < 10 {
    print(i)
    i += 1
}

// do ... while
repeat {
    print(i)
    i -= 1
} while i > 0


for number in 1...10 {
    if number % 2 != 0
    continue
    //跳出当前循环 进入下一个循环
    print(number)
}

for number in 1...10 {
    if number > 8 { break }//结束当前循环
    print(number)
}
// 1 2 3 4 5 6 7 8























***/



