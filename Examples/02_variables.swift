// variables.swift
// Example demonstrating Swift variables and data types

// Print title
print("Swift Variables and Data Types")
print("============================\n")

// --------------
// Basic Variables
// --------------

// String variable
let courseName = "Swift Programming"
print("Course: \(courseName)")

// Integer variable
var studentCount = 25
print("Initial student count: \(studentCount)")

// Update the variable (var can be changed, let cannot)
studentCount += 5
print("Updated student count: \(studentCount)")

// Double variable
let courseRating = 4.8
print("Course rating: \(courseRating) / 5.0")

// Boolean variable
let courseAvailable = true
print("Course available: \(courseAvailable)")

// --------------
// Type Annotations
// --------------

// Explicit type annotations
var totalHours: Int = 35
var price: Double = 199.99
var instructorName: String = "Jane Smith"
var isAdvancedCourse: Bool = false

print("\nCourse details:")
print("- Total hours: \(totalHours)")
print("- Price: $\(price)")
print("- Instructor: \(instructorName)")
print("- Advanced course: \(isAdvancedCourse)")

// --------------
// Constants vs Variables
// --------------

print("\nConstants vs Variables:")

// This works because studentCount is a variable (var)
studentCount = 32
print("Changed student count to: \(studentCount)")

// This would cause an error because courseName is a constant (let)
// courseName = "Advanced Swift Programming"  // Uncomment to see error

// --------------
// Type Inference
// --------------

// Swift infers these types automatically
let semester = "Fall 2025"        // String
let totalStudents = 150           // Int
let averageGrade = 92.7           // Double
let hasPrerequisites = true       // Bool

print("\nInferred types example:")
print("Semester: \(semester)")
print("Total students: \(totalStudents)")
print("Average grade: \(averageGrade)")
print("Has prerequisites: \(hasPrerequisites)")

// --------------
// Collections
// --------------

// Array
var programmingLanguages = ["Swift", "Python", "JavaScript", "Kotlin"]
print("\nProgramming languages: \(programmingLanguages)")
programmingLanguages.append("Rust")
print("After adding a language: \(programmingLanguages)")
print("First language: \(programmingLanguages[0])")

// Dictionary
var courseCatalog = [
    "iOS101": "Intro to iOS Development",
    "SWIFT200": "Intermediate Swift",
    "WEBDEV": "Web Development Fundamentals"
]
print("\nCourse catalog: \(courseCatalog)")
print("Course SWIFT200: \(courseCatalog["SWIFT200"] ?? "Not found")")

// Add entry to dictionary
courseCatalog["ML300"] = "Machine Learning Basics"
print("Updated catalog: \(courseCatalog)")

// --------------
// Type Safety
// --------------

print("\nType safety example:")
let productID = 12345
// let productName = productID + "Premium"  // This will error - can't add Int and String
let productName = "\(productID)Premium"    // This works - convert to string first
print("Product name: \(productName)")

// --------------
// Type Conversion
// --------------

print("\nType conversion:")
let stringNumber = "42"
if let number = Int(stringNumber) {
    print("\"\(stringNumber)\" converted to Int: \(number)")
    let doubledNumber = number * 2
    print("\(number) doubled: \(doubledNumber)")
}

// --------------
// Summary
// --------------

print("\nSummary of Swift Variables:")
print("- Use 'let' for constants and 'var' for variables")
print("- Swift uses type inference but also supports explicit typing")
print("- Common types: String, Int, Double, Bool, Array, Dictionary")
print("- Swift is type-safe, requiring explicit conversions between types")
