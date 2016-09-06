/*:
 # Practicing Swift
 
 ### Complete the following so the test code below runs.
 
 ## Track enum
 
 An enum with 4 possible cases: Intro (intro track, 4 weeks), Game (game track, 8 weeks), App (app track, 8 weeks), VR (virtual reality track, 8 weeks) where the raw value and length in weeks is in parenthesis.
 
    enum Track : String {
        var lengthInWeeks: Int { get } // computed property
    }
 
 ## Center class
 
 The `enrollStudent` function should:
 - Add student to track if it exists at center.
 - Print "Enrolled [student.fullName] in [location]'s [track.lengthInWeeks]-week [track.rawValue]." if track exists.
 - Print "The [location] center does not have a [track.rawValue]!" if the track does not exist.

 
    class Center {
        let location: String
        var enrollment: [Track : [Student]]

        var students: [Student] { get } // computed property

        init(location: String, tracks: [Track])
 
        func enrollStudent(student: Student, track: Track)
    }
 
 ## Student class

    class Student {
        var firstName: String
        var middleName: String?
        var lastName: String

        var fullName: String { get } // computed property

        init(firstName: String, middleName: String?, lastName: String)
        convenience init(firstName: String, lastName: String)
    }
 
 */
import Foundation

// Your code goes below here

/* An enum with 4 possible cases: Intro
   (intro track, 4 weeks), Game (game track, 8 weeks),
   App (app track, 8 weeks), VR (virtual reality track,
   8 weeks) where the raw value and length in weeks is in parenthesis. */
enum Track: String {
    case Intro = "intro track"
    case Game = "game track"
    case App = "app track"
    case VR = "virtual reality track"
    var lengthInWeeks: Int {
        //For the computed property, 
        //we need to invoke the get command 
        //to retrive an integer for the number
        //of weeks depending on the case switch.
        get{
            switch self{
                case .Intro: return 4
                case .Game: return 8
                case .App: return 8
                case .VR: return 8
            }
        }
    } // computed property
}

extension Track: Equatable{
    
}

class Center {
    
    let location: String
    
    //number of enrollment 
    //declared in a dictionary
    var enrollment: [Track : [Student]]

    //the same code was missing a tracks variable 
    //for the init function.
    var tracks: [Track]
    
    //computed property for number of enrolled students
    var students: [Student]{
        get{
            return self.students
        }
    }
    
    init(location: String, tracks: [Track]){
        self.location = location
        self.tracks = tracks
        enrollment = [Track : [Student]]()
    }
    
    /* The enrollStudent function should:
     •	Add student to track if it exists at center.
     •	Print "Enrolled [student.fullName] in [location]'s [track.lengthInWeeks]-week [track.rawValue]." if track exists.
     •	Print "The [location] center does not have a [track.rawValue]!" if the track does not exist. */
    func enrollStudent(student: Student, track: Track) {
        if (tracks.contains(track)) {
            guard let _ = enrollment[track]?.append(student) else{
                enrollment[track] = [student]
                return
            }
            print("Enrolled " + student.fullName + " in " + location + "'s \(track.lengthInWeeks)-week \(track.rawValue)")
        }else{
            print("The " + location + " center does not have a \(track.rawValue)!")
        }
    }
}


class Student {
    var firstName: String
    var middleName: String?
    var lastName: String
    
    var fullName: String {
        get{
            return firstName + " " + middleName! + lastName  // computed property
        }
    }
    //This is an init function if the person has a 
    //firstname, middlename, and lastname
    init(firstName: String, middleName: String?, lastName: String){
        self.firstName = firstName
        self.middleName = (middleName! + " ")
        self.lastName = lastName
    }
    //Not everyone has a middle name.
    convenience init(firstName: String, lastName: String){
        let middleName:String = ""
        self.init(firstName: firstName, middleName: middleName, lastName: lastName)
    }
}

extension Array {
    //extension to retrieve a random element insde an array. 
    //There are a couple functions called randomElement() inside the
    //test code for both the array centers and students.
    func randomElement() -> Element { 
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    //This function was used for debugging to return
    //an element from an array.
    func getElement(indexArgument: Int ) -> Element {
        let index = indexArgument
        return self[index]
    }
    
}

// Your code goes above here
/*:
 ## Testing your code
 
 ### Uncomment the code below to test. It should print something along the lines of...
 
    Enrolled Peter Parker in New York City's 8-week app track.
    Enrolled Mary Jane Watson in Silicon Valley's 8-week app track.

    [...]

    Enrolled Mary Jane Watson in Los Angeles's 4-week intro track.
    Enrolled Peter Parker in Los Angeles's 4-week intro track.
    The Los Angeles center does not have a virtual reality track!
    There are 26 students in San Francisco.
    There are 24 students in Silicon Valley.
    There are 26 students in Los Angeles.
    There are 24 students in New York City.
 
*/

let sf = Center(location: "San Francisco", tracks: [.Intro, .Game, .App, .VR])
let sv = Center(location: "Silicon Valley", tracks: [.Intro, .Game, .App,])
let la = Center(location: "Los Angeles", tracks: [.Intro, .Game])
let nyc = Center(location: "New York City", tracks: [.Intro, .Game, .App])
let centers = [sf, sv, la, nyc]

let students = [Student(firstName: "Peter", lastName: "Parker"),
                Student(firstName: "Mary", middleName: "Jane", lastName: "Watson")]

for _ in 0..<100 {
    let center = centers.randomElement()
    let student = students.randomElement()
    let track = center.tracks.randomElement()
    center.enrollStudent(student, track: track)
}
    la.enrollStudent(students.randomElement(), track: .VR)

for center in centers {
    var sum = 0
    for(key, value) in center.enrollment{
        sum += value.count
    }
    print("There are \(sum) students in \(center.location).")
}



