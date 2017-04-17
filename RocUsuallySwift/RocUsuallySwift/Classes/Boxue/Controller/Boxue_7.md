** 理解引用语义的自定义类型

理解引用语义的自定义类型

表面上看，class和struct有很多相似的地方。它们都可以用来自定义类型、都可以有properties，也都可以有methods。因此，单纯从语法上来理解class是个没什么意义的事情。作为Swift中的引用类型，class表达的是一个具有明确生命周期的对象，我们需要关注这类内容的“生死存亡”。而值类型，我们关心的就真的只有它的值而已。正是由于这种语义上的差异，让class从初始化方式、类型设计思路、内存管理到方法的派发机制，和值类型都截然不同。另外，由于Swift自身可以桥接到Objective-C，还支持通过extension对类型扩展，这让Swift中的class类型更加复杂，甚至有些情况，还和我们对面向对象的直觉有些不同。


//4.-- 确定继承关系用于模拟“is a”的关系

import UIKit

class BoxueViewController: UIViewController {

override func viewDidLoad() {
super.viewDidLoad()

self.view.backgroundColor = UIColor.white

let mars = Person(name: "Mars")
let jeff = Employee(name: "Jeff", staffNumber: 23)

printName(of: mars) // Mars
printName(of: jeff) // Jeff


}


func printName(of person: Person) {
print(person.name)
}

}


class Person{
var name:String

init(name : String) {
self.name = name
}
}

class Employee: Person{
var staffNumber: Int


init(name: String, staffNumber: Int) {
self.staffNumber = staffNumber
super.init(name: name)
}
}


//5.确定对象的组合用于模拟“has a”的关系


