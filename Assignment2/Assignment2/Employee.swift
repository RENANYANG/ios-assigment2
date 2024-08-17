//
//  Employee.swift
//  Assignment2
//
//  Created by RENANYANG on 2024-08-16.
//

import Foundation

struct Employee: Identifiable, Codable {
    var id: String // Maps to "uuid" in JSON
    var fullName: String
    var phoneNumber: String
    var emailAddress: String
    var biography: String
    var photoUrlSmall: String
    var photoUrlLarge: String
    var team: String
    var employeeType: String
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
        case biography
        case photoUrlSmall = "photo_url_small"
        case photoUrlLarge = "photo_url_large"
        case team
        case employeeType = "employee_type"
    }
    
    var employeeTypeDescription: String {
        switch employeeType {
        case "FULL_TIME":
            return "Full time"
        case "PART_TIME":
            return "Part time"
        case "CONTRACTOR":
            return "Contractor"
        default:
            return employeeType
        }
    }
}


