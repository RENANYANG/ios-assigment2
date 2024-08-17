//
//  EmployeesView.swift
//  Assignment2
//
//  Created by RENANYANG on 2024-08-16.
//

//import Foundation
//import SwiftUI
//
//struct EmployeesView: View {
//    @StateObject private var viewModel = EmployeeViewModel()
//
//    var body: some View {
//        NavigationView {
//            if viewModel.isLoading {
//                ProgressView("Loading...")
//            } else if viewModel.hasError {
//                Text("Failed to load employees.")
//            } else if viewModel.isEmpty {
//                Text("No employees available.")
//            } else {
//                List(viewModel.employees) { employee in
//                    NavigationLink(destination: EmployeeDetailView(employee: employee)) {
//                        HStack {
//                            AsyncImage(url: URL(string: employee.photoUrl)!) {
//                                Text("Loading...")
//                            }
//                            .frame(width: 50, height: 50)
//                            .clipShape(Circle())
//
//                            VStack(alignment: .leading) {
//                                Text(employee.fullName)
//                                Text(employee.team)
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                            }
//                        }
//                    }
//                }
//                .refreshable {
//                    viewModel.fetchEmployees()
//                }
//                .searchable(text: .constant(""))
//                .navigationTitle("Employees")
//            }
//        }
//        .onAppear {
//            viewModel.fetchEmployees()
//        }
//    }
//}
