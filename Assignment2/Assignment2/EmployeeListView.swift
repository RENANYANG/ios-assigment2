//
//  EmployeeListView.swift
//  Assignment2
//
//  Created by RENANYANG on 2024-08-17.
//

import SwiftUI

struct EmployeeListView: View {
    @StateObject private var viewModel = EmployeeViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            Group {
                if viewModel.hasError {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                } else if viewModel.isEmpty {
                    Text("No employees found.")
                } else {
                    List(filteredEmployees) { employee in
                        NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                            EmployeeRow(employee: employee)
                        }
                    }
                    .searchable(text: $searchText)
                    .refreshable {
                        viewModel.fetchEmployees()
                    }
                }
            }
            .navigationTitle("Employees")
            .onAppear {
                viewModel.fetchEmployees()
            }
        }
    }

    private var filteredEmployees: [Employee] {
        if searchText.isEmpty {
            return viewModel.employees
        } else {
            return viewModel.employees.filter {
                $0.fullName.localizedCaseInsensitiveContains(searchText) ||
                $0.team.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct EmployeeRow: View {
    let employee: Employee

    var body: some View {
        HStack {
            // Safely unwrap the URL
            if let photoUrl = URL(string: employee.photoUrlSmall) {
                AsyncImage(url: photoUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 50, height: 50)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    case .failure:
                        Image(systemName: "person.crop.rectangle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    @unknown default:
                        Image(systemName: "person.crop.rectangle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                }
                .frame(width: 50, height: 50)
            } else {
                Image(systemName: "person.crop.rectangle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading) {
                Text(employee.fullName)
                    .font(.headline)
                Text(employee.team)
                    .font(.subheadline)
            }
        }
    }
}
