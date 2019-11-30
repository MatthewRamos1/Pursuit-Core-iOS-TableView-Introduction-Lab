import Foundation

struct Task {
    
    enum Status: Int {
        
        case notStarted = 0
        case inProgress = 1
        case completed = 2
    }
    
    let name: String
    let status: Status
    let dueDate: Date    
    
    static var allTasks: [Task] {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return [
            Task(name: "Create project roadmap",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "08-13-2020")!),
            Task(name: "Source information session speakers",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "09-22-2020")!),
            Task(name: "Secure event funding",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "09-28-2020")!),
            Task(name: "Secure venue for keynote",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "10-23-2020")!),
            Task(name: "Identify event KPIs",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "7-04-2020")!),
            Task(name: "Create internal newsletter advertising event",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "6-09-2020")!),
            Task(name: "Submit food budget",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "6-12-2020")!),
            Task(name: "Create event logo",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "5-02-2020")!),
            Task(name: "Make companion iOS application for event",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "11-14-2020")!),
            Task(name: "Get celebrity speaker (Tim Cook?)",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "8-16-2020")!),
            Task(name: "Purchase event insurance",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "5-19-2020")!),
            Task(name: "Get event SWAG",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "8-20-2020")!),
            Task(name: "Secure seat with SpaceX",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "11-13-2020")!),
            Task(name: "Conduct brainstorming session",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "10-03-2020")!),
            Task(name: "Get all necessary headcount allocated",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "04-13-2020")!),
        ]
    }
    
    static func getSections() -> [[Task]] {
        let sortedTasks = allTasks.sorted { $0.status.rawValue < $1.status.rawValue }
        let uniqueSections = Set(sortedTasks.map { $0.status })
        var sections = Array(repeating: [Task](), count: uniqueSections.count)
        var currentIndex = 0
        var currentSection = sortedTasks.first?.status ?? Status.notStarted
        for task in sortedTasks {
            if task.status == currentSection {
                sections[currentIndex].append(task)
            } else {
                currentIndex += 1
                currentSection = task.status
            }
        }
        return sections
    }

}
