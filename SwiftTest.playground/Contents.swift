//: Playground - noun: a place where people can play

import Foundation
import Cocoa

/*:

    enum Track : String {
        var lengthInWeeks: Int { get }
    }

    class Center {
        let location: String
        var enrollment: [Track : [Student]]

        var students: [Student] { get }

        init(location: String, tracks: [Track])

        func enrollStudent(student: Student, track: Track)
    }

    class Student {
        var firstName: String
        var middleName: String?
        var lastName: String

        var fullName: String { get }

        init(firstName: String, middleName: String?, lastName: String)

        convenience init(firstName: String, lastName: String)
    }
 
*/

enum Track: String {
    case Intro = "intro track"
    case Game = "game track"
    case App = "app track"
    case VR = "virtual reality track"
    
    var lengthInWeeks: Int {
        switch self {
        case .Intro:
            return 4
        default:
            return 8
        }
    }
}

class Center {
    let location: String
    var enrollment = [Track : [Student]]()
    var students: [Student] {
        return Array(enrollment.values.flatten())
    }
    
    init(location: String, tracks: [Track]) {
        self.location = location
        for track in tracks {
            self.enrollment[track] = []
        }
    }
    
    func enrollStudent(student: Student, track: Track) {
        if let _ = enrollment[track]?.append(student) {
            print("Enrolled \(student.fullName) in \(location)'s \(track.lengthInWeeks)-week \(track.rawValue).")
        } else {
            print("The \(location) center does not have a \(track.rawValue)!")
        }
    }
}

class Student {
    var firstName: String
    var middleName: String?
    var lastName: String
    
    var fullName: String {
        if let middleName = middleName {
            return "\(firstName) \(middleName) \(lastName)"
        } else {
            return "\(firstName) \(lastName)"
        }
    }
    
    init(firstName: String, middleName: String?, lastName: String) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
    }
    
    convenience init(firstName: String, lastName: String) {
        self.init(firstName: firstName, middleName: nil, lastName: lastName)
    }
}

extension Array {
    func randomElement() -> Element {
        return self[random() % self.count]
    }
}

let sf = Center(location: "San Francisco", tracks: [.Intro, .Game, .App, .VR])
let sv = Center(location: "Silicon Valley", tracks: [.Intro, .Game, .App,])
let la = Center(location: "Los Angeles", tracks: [.Intro, .Game])
let nyc = Center(location: "New York City", tracks: [.Intro, .Game, .App])
let centers = [sf, sv, la, nyc]

for _ in 0..<100 {
    let center = centers.randomElement()
    let student = Student(firstName: "Dion", lastName: "Larson")
    let track = Array(center.enrollment.keys).randomElement()
    center.enrollStudent(student, track: track)
}

for center in centers {
    print("There are \(center.students.count) students in \(center.location).")
}

























