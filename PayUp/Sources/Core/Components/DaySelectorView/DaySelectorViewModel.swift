//
//  DaySelectorViewModel.swift
//  PayUp
//
//  Created by Diogo on 05/10/2025.
//
import Foundation

final class DaySelectorViewModel {
    
    let days = ["DOM", "SEG", "TER", "QUA", "QUI", "SEX", "SAB"]
    
    private let calendar = Calendar.current
    
    var selectedIndex: Int {
        let weekday = calendar.component(.weekday, from: Date())
        return (weekday + 5) % 7 // Adjusting to make Sunday (1) -> 0, Monday (2) -> 1, ..., Saturday (7) -> 6
    }
    
    var onDaySelected: ((Int) -> Void)?
    
    func selectDay(at index: Int) {
        onDaySelected?(index)
    }
    
}
