// Copy your Animal class here
class Animal {
    // An Animal has a name and favorite food, and it can sleep and eat.
    var name: String = ""
    var favoriteFood: String = ""
    
    init(name: String, favoriteFood: String) {
        self.name = name
        self.favoriteFood = favoriteFood
    }
    
    func sleep() {
        // Copy your sleep function and modify it to work as an instance method
        print("\(name) sleeps for 8 hours")
    }
    
    func eat(food: String) {
        // Copy your eat function and modify it to work as an instance method
        print("\(name) eats \(food)")
    }
    
}

// Copy your Tiger class here
class Tiger: Animal {
    // A Tiger is an Animal that likes meat.
    init(name: String){
        super.init(name:name, favoriteFood:"meat")
    }
    
    override func sleep(){
        print("\(name) sleeps for 8 hours")
    }
    
    override func eat (food: String){
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
    }
    
}

// Copy your Bear class here
class Bear: Animal {
    // A Bear is an Animal that likes fish and hibernates.
    init(name: String){
        super.init(name:name, favoriteFood:"fish")
    }
    
    override func sleep(){
        print("\(name) hibernates for 4 months")
    }
    
    override func eat (food: String){
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
    }
}

// Copy your Unicorn class here
class Unicorn: Animal {
    // A Unicorn is an Animal that likes marshmallows and sleeps in a cloud.
    init(name: String){
        super.init(name:name, favoriteFood:"marshmallows")
    }
    override func eat (food: String){
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
    }
    
    override func sleep(){
        print("\(name) sleeps in a cloud")
    }
}

// Copy your Giraffe class here
class Giraffe: Animal {
    // A Giraffe is an Animal that eats only leaves.
    init(name: String){
        super.init(name:name, favoriteFood:"leaves")
    }
    override func sleep(){
        print("\(name) sleeps for 8 hours")
    }
    override func eat (food: String){
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
        else{
            print("YUCK! \(name) spits out \(food)")
        }
    }
}

// Copy your Bee class here
class Bee: Animal {
    // A Bee is an Animal that eats only pollen and never sleeps.
    init(name: String){
        super.init(name:name, favoriteFood:"pollen")
    }
    override func sleep(){
        print("\(name) never sleeps")
    }
    
    override func eat (food: String){
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
        else{
            print("YUCK! \(name) spits out \(food)")
        }
    }
}

// Implement the Zookeeper class here
class Zookeeper {
    // A Zookeeper has a name and can feed Animals
    var name: String = ""
    
    
    // Implement the initalizer method here
    init(name: String) {
        self.name = name
    }
    
    // Implement the feedAnimals method here
    func feedAnimals(animals: [Animal], food: String) {
        let size = animals.count
        print("\(name) is feeding \(food) to \(size) animals")
        for i in 0...size-1 {
            animals[i].eat(food)
            animals[i].sleep()
        }
    }
}
/*
 This code tests the Animal, Tiger, Bear, Unicorn, Giraffe and Bee classes
 and then tests the Zookeeper class and its feedAnimals method
 */
func test() {
    
    func getline() -> String {
        // Read a line from standard input and string surrounding whitespace
        // Sourced from http://mgrebenets.github.io/hackerrank/2015/03/15/hackerrank-in-swift---io/
        var buf = String()
        var c = getchar()
        // 10 is ascii code for newline
        while c != EOF && c != 10 {
            buf.append(UnicodeScalar(UInt32(c)))
            c = getchar()
        }
        return buf
    }
    
    let numberOfTests = Int(getline())!
    var animals = [Animal]()
    
    for _ in 0..<numberOfTests {
        // Get the animal's species, name, and food to eat
        let species = getline()
        let name = getline()
        let animal: Animal
        // Check what species this animal is
        switch species {
        case "tiger":
            animal = Tiger(name: name)
        case "bear":
            animal = Bear(name: name)
        case "unicorn":
            animal = Unicorn(name: name)
        case "giraffe":
            animal = Giraffe(name: name)
        case "bee":
            animal = Bee(name: name)
        default:
            animal = Animal(name: name, favoriteFood: "kibble")
        }
        // Add the animal to the list of animals
        animals.append(animal)
    }
    
    // Get the zookeeper's name and food to feed the animals
    let zookeeperName = getline()
    let zookeeperFood = getline()
    // Create a Zookeeper object and test its feedAnimals method
    let zookeeper = Zookeeper(name: zookeeperName)
    zookeeper.feedAnimals(animals, food: zookeeperFood)
    
}

test()










































////////////////////////////////////////////////////////////////////////////////
//Problem 6

//Copy your Animal class here
class Animal {
    // An Animal has a name and favorite food, and it can sleep and eat.
    var name: String = ""
    var favoriteFood: String = ""
    
    init(name: String, favoriteFood: String) {
        self.name = name
        self.favoriteFood = favoriteFood
    }
    
    func sleep() {
        // Copy your sleep function and modify it to work as an instance method
        print("\(name) sleeps for 8 hours")
    }
    
    func eat(food: String) {
        // Copy your eat function and modify it to work as an instance method
        print("\(name) eats \(food)")
    }
}

// Copy your Tiger class here
class Tiger: Animal {
    // A Tiger is an Animal that likes meat.
    init(name: String){
        super.init(name:name, favoriteFood:"meat")
    }
    
    override func sleep(){
        print("\(name) sleeps for 8 hours")
    }
    
    override func eat (food: String){
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
    }
}

// Copy your Bear class here
class Bear: Animal {
    // A Bear is an Animal that likes fish and hibernates.
    init(name: String){
        super.init(name:name, favoriteFood:"fish")
    }
    
    override func sleep(){
        print("\(name) hibernates for 4 months")
    }
    
    override func eat (food: String){
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
    }
}

// Implement the Unicorn class here as a subclass of Animal
// Hint: Implement the initializer method and override the sleep method
class Unicorn: Animal {
    // A Unicorn is an Animal that likes marshmallows and sleeps in a cloud.
    init(name: String){
        super.init(name:name, favoriteFood:"marshmallows")
    }
    override func eat (food: String){
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
    }
    
    override func sleep(){
        print("\(name) sleeps in a cloud")
    }
    
}

// Implement the Giraffe class here as a subclass of Animal
// Hint: Implement the initializer method and override the eat method
class Giraffe: Animal {
    // A Giraffe is an Animal that eats only leaves.
    init(name: String){
        super.init(name:name, favoriteFood:"leaves")
    }
    override func sleep(){
        print("\(name) sleeps for 8 hours")
    }
    override func eat (food: String){
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
        else{
            print("YUCK! \(name) spits out \(food)")
        }
    }
}

// Implement the Bee class here as a subclass of Animal
// Hint: Implement the initializer method and override the sleep and eat methods
class Bee: Animal {
    // A Bee is an Animal that eats only pollen and never sleeps.
    init(name: String){
        super.init(name:name, favoriteFood:"pollen")
    }
    override func sleep(){
        print("\(name) never sleeps")
    }
    
    override func eat (food: String){
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
        else{
            print("YUCK! \(name) spits out \(food)")
        }
    }
}


func test() {
    
    func getline() -> String {
        // Read a line from standard input and string surrounding whitespace
        // Sourced from http://mgrebenets.github.io/hackerrank/2015/03/15/hackerrank-in-swift---io/
        var buf = String()
        var c = getchar()
        // 10 is ascii code for newline
        while c != EOF && c != 10 {
            buf.append(UnicodeScalar(UInt32(c)))
            c = getchar()
        }
        return buf
    }
    
    let numberOfTests = Int(getline())!
    
    for _ in 0..<numberOfTests {
        // Get the animal's species, name, and food to eat
        let species = getline()
        let name = getline()
        let food = getline()
        let animal: Animal
        // Check what species this animal is
        switch species {
        case "tiger":
            animal = Tiger(name: name)
        case "bear":
            animal = Bear(name: name)
        case "unicorn":
            animal = Unicorn(name: name)
        case "giraffe":
            animal = Giraffe(name: name)
        case "bee":
            animal = Bee(name: name)
        default:
            animal = Animal(name: name, favoriteFood: "kibble")
        }
        // Test the animal's eat method
        animal.eat(food)
        animal.sleep()
    }
    
}

test()
///////////////////////////////////////////////////////////////////////////////















































////////////////////////////////////////////////////////////////////////////////
/*
 problem 5
 This code will test your Animal, Tiger, and Bear classes
 */


// Complete the Animal class as well as the Tiger and Bear subclasses below
class Animal {
    // An Animal has a name and favorite food, and it can sleep and eat.
    var name: String = ""
    var favoriteFood: String = ""
    
    init(name: String, favoriteFood: String) {
        self.name = name
        self.favoriteFood = favoriteFood
    }
    
    func sleep() {
        // Copy your sleep function and modify it to work as an instance method
        if favoriteFood == "meat"{
            print("\(name) sleeps for 8 hours")
        }
        if favoriteFood == "fish"{
            print("\(name) hibernates for 4 months")
        }
    }
    
    
    func eat(food: String) {
        // Copy your eat function and modify it to work as an instance method
        print("\(name) eats \(food)")
        
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
    }
}

class Tiger: Animal {
    // A Tiger is an Animal that likes meat.
    init(name: String){
        super.init(name:name, favoriteFood:"meat")
    }
}

class Bear: Animal {
    // A Bear is an Animal that likes fish and hibernates.
    init(name: String){
        super.init(name:name, favoriteFood:"fish")
    }
}

func test() {
    
    func getline() -> String {
        // Read a line from standard input and string surrounding whitespace
        // Sourced from http://mgrebenets.github.io/hackerrank/2015/03/15/hackerrank-in-swift---io/
        var buf = String()
        var c = getchar()
        // 10 is ascii code for newline
        while c != EOF && c != 10 {
            buf.append(UnicodeScalar(UInt32(c)))
            c = getchar()
        }
        return buf
    }
    
    let numberOfTests = Int(getline())!
    
    for _ in 0..<numberOfTests {
        // Get the animal's species, name, and food to eat
        let species = getline()
        let name = getline()
        let food = getline()
        let animal: Animal
        switch species {
        case "tiger":
            animal = Tiger(name: name)
        case "bear":
            animal = Bear(name: name)
        default:
            animal = Animal(name: name, favoriteFood: "kibble")
        }
        // Test Animal, Tiger, and Bear classes and their eat method
        animal.eat(food)
        animal.sleep()
    }
    
}

test()
////////////////////////////////////////////////////////////////////////////////

































// Complete the sleep and eat functions below
import Foundation

let favoriteFood = "meat"


// Complete the sleep and eat functions below
func sleep(name: String) {
    print("\(name) sleeps for 8 hours")
}

func eat(name: String, food: String){
    print("\(name) eats \(food)")
    if food == favoriteFood {
        print("YUM!  \(name) +  wants more , \(food)")
    }
}

eat("Tiger", food: "meat")





class Tiger {
    // A Tiger is an Animal that likes meat.
    var name: String = ""
    var favoriteFood: String = "meat"
    
    init(name: String) {
        // Write an initializer method here
        self.name = name
    }
    
    func sleep() {
        // Copy your sleep function and modify it to work as an instance method
        print("\(name) sleeps for 8 hours")
    }
    
    func eat(food: String) {
        // Copy your eat function and modify it to work as an instance method
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
        
    }
    
}

class Bear {
    // Implement the Bear class here
    
    // A Tiger is an Animal that likes meat.
    var name: String = ""
    var favoriteFood: String = "fish"
    
    init(name: String) {
        // Write an initializer method here
        self.name = name
    }
    
    func sleep() {
        // Copy your sleep function and modify it to work as an instance method
        print("\(name) hibernates for 4 months")
    }
    
    func eat(food: String) {
        // Copy your eat function and modify it to work as an instance method
        print("\(name) eats \(food)")
        if food == favoriteFood {
            print("YUM! \(name) wants more \(food)")
        }
        
    }
    
}





//problem 3 and 4
func test() {
    
    func getline() -> String {
        // Read a line from standard input and string surrounding whitespace
        // Sourced from http://mgrebenets.github.io/hackerrank/2015/03/15/hackerrank-in-swift---io/
        var buf = String()
        var c = getchar()
        // 10 is ascii code for newline
        while c != EOF && c != 10 {
            buf.append(UnicodeScalar(UInt32(c)))
            c = getchar()
        }
        return buf
    }
    
    let numberOfTests = Int(getline())!
    
    for _ in 0..<numberOfTests {
        let species = getline()
        let name = getline()
        let food = getline()
        // Test Tiger and Bear classes and their eat method
        if species == "tiger" {
            let tiger = Tiger(name: name)
            tiger.eat(food)
            tiger.sleep()
        } else if species == "bear" {
            let bear = Bear(name: name)
            bear.eat(food)
            bear.sleep()
        }
    }
    
}

test()



////////////////////////////////////////////////////////////////////////////////////////
//Function used for problem 1 and 2
func test() {
    
    func getline() -> String {
        // Read a line from standard input and string surrounding whitespace
        // Sourced from http://mgrebenets.github.io/hackerrank/2015/03/15/hackerrank-in-swift---io/
        var buf = String()
        var c = getchar()
        // 10 is ascii code for newline
        while c != EOF && c != 10 {
            buf.append(UnicodeScalar(UInt32(c)))
            c = getchar()
        }
        return buf
    }
    
    let numberOfTests = Int(getline())!
    
    for _ in 0..<numberOfTests {
        let name = getline()
        let food = getline()
        // Test eat function
        eat(name, food)
        sleep(name)
    }
    
}

test()

////////////////////////////////////////////////////////////////////////////////////////