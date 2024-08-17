//
//  EmployeeViewModel.swift
//  Assignment2
//
//  Created by RENANYANG on 2024-08-16.
//

import Foundation
import Combine

class EmployeeViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var isEmpty: Bool = false
    @Published var hasError: Bool = false
    @Published var errorMessage: String = ""

    private var cancellables = Set<AnyCancellable>()
    
    private let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json")!
    
    func fetchEmployees() {
        if let cachedData = loadCachedEmployees() {
            decodeAndSetEmployees(from: cachedData)
        } else {
            fetchFromNetwork()
        }
    }
    
    private func fetchFromNetwork() {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [String: [Employee]].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.hasError = true
                    self.errorMessage = "Failed to load employees: \(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] result in
                self?.employees = result["employees"] ?? []
                self?.isEmpty = self?.employees.isEmpty ?? true
                self?.cacheEmployees(result)
            })
            .store(in: &cancellables)
    }
    
    private func decodeAndSetEmployees(from data: Data) {
        do {
            let result = try JSONDecoder().decode([String: [Employee]].self, from: data)
            self.employees = result["employees"] ?? []
            self.isEmpty = self.employees.isEmpty
        } catch {
            self.hasError = true
            self.errorMessage = "Failed to load cached employees."
            print("Decoding error: \(error.localizedDescription)")
        }
    }
    
    private func cacheEmployees(_ employees: [String: [Employee]]) {
        do {
            let data = try JSONEncoder().encode(employees)
            UserDefaults.standard.set(data, forKey: "cachedEmployees")
        } catch {
            print("Failed to cache employees: \(error.localizedDescription)")
        }
    }
    
    private func loadCachedEmployees() -> Data? {
        return UserDefaults.standard.data(forKey: "cachedEmployees")
    }
}
