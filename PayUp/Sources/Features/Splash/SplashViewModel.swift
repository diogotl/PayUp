//
//  SplashViewModel.swift
//  PayUp
//
//  Created by Diogo on 04/08/2025.
//

import Foundation

final class SplashViewModel {
    
    var onAnimationComplete: (() -> Void)?
    
    func performInitialAnimation(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completion()
        }
    }
}
