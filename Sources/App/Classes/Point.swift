//
//  Point.swift
//  App
//
//  Created by Cobey Hollier on 2019-10-03.
//
import Vapor

import Foundation

final class Point: Content {
    let x: Int
    let y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func log() {
        print("(\(self.x), \(self.y))")
    }
}
