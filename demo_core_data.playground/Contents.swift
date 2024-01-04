import UIKit

protocol CanRun {
    func actionRun()
}

protocol CanSwim {
    func actionSwim()
}

class Animal {
    var name: String

    init(name: String) {
        self.name = name
    }

    func makeSound() {
        print("Cet animal émet un son")
    }
}

class Dog: Animal, CanRun {
    func actionRun() {
        print("Le chien peut courir")
    }
    
    override func makeSound() {
        print("Le chien aboie")
    }
}

class Fish: Animal, CanSwim {
    func actionSwim() {
        print("Le poisson peut nager")
    }
    
    override func makeSound() {
        print("Le poisson fait des bulles")
    }
}

let myDog = Dog(name: "Rex")
myDog.makeSound()
myDog.actionRun()

let myFish = Fish(name: "Whiskers")
myFish.makeSound()
myFish.actionSwim()
