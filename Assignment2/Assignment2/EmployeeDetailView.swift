//
//  EmployeeDetailView.swift
//  Assignment2
//
//  Created by RENANYANG on 2024-08-16.
//

import SwiftUI

struct EmployeeDetailView: View {
    var employee: Employee

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let photoUrl = URL(string: employee.photoUrlLarge) {
                AsyncImage(url: photoUrl) {_ in 
                    Text("Loading...")
                }
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipShape(Rectangle())
                .cornerRadius(10)
            } else {
                Image(systemName: "person.crop.rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
            }

            Text(employee.fullName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(employee.team)
                .font(.title3)
                .foregroundColor(.gray)

            Text(employee.biography)
                .font(.body)

            Text("Email: \(employee.emailAddress)")
                .font(.headline)

            Text("Phone Number: \(employee.phoneNumber)")
                .font(.headline)

            Text("Employee Type: \(employee.employeeTypeDescription)")
                .font(.headline)

            Spacer()
        }
        .padding()
        .navigationTitle(employee.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}



