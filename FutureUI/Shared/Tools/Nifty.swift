//
//  Nifty.swift
//  FutureUI
//
//  Created by Felix Akira Green on 1/24/21.
//

import Foundation

/// Returns the input value clamped to the lower and upper limits.
func clamp<T: Comparable>(value: T, lower: T, upper: T) -> T {
	return min(max(value, lower), upper)
}

extension Collection {
	/// This allows for ANY index to be fetched & set safely
	subscript(optional i: Index) -> Iterator.Element? {
		get {
			return self.indices.contains(i) ? self[i] : nil
		}
		set(newValue) {
			if self.indices.contains(i) {
				self[optional: i] = newValue
			}
		}
	}
	
	/// This allows for an OPTIONAL index to be fetched & set safely
	subscript(optional i: Index?) -> Iterator.Element? {
		get {
			if let index = i {
				return self[optional: index]
			}
			return nil
		}
		set(newValue) {
			if let index = i {
				self[optional: index] = newValue
			}
		}
	}
}

/// Allows for an optional key to be used for a DIctionary
extension Dictionary {
	subscript(optional k: Key?) -> Value? {
		get {
			if let key = k {
				return self[key]
			}
			return nil
		}
		set(newValue) {
			if let key = k {
				self[key] = newValue
			}
		}
	}
}
