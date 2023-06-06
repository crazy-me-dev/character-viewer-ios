//
//  Observable.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import Foundation

public final class Observable<Value> {
    private var closure: ((Value) -> ())?
    
    public var value: Value {
        didSet { closure?(value) }
    }
    
    public init(_ value: Value) {
        self.value = value
    }
    
    public func observe(_ closure: @escaping (Value) -> Void) {
        self.closure = closure
        closure(value)
    }
}
