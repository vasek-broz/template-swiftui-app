//  Cache.swift
//  Created by Václav Brož on 20/12/2021

import Foundation

final class Cache<Key: Hashable, Value> {
    // MARK: - Properties -
    private let nextStepCache = NSCache<NextStepCacheKey, NextStepCacheEntry>()

    // MARK: - Methods -
    func insert(_ value: Value, for key: Key) {
        let nextStepCacheEntry = NextStepCacheEntry(value: value)
        nextStepCache.setObject(nextStepCacheEntry, forKey: NextStepCacheKey(key))
    }

    func value(for key: Key) -> Value? {
        let nextStepCacheEntry = nextStepCache.object(forKey: NextStepCacheKey(key))
        return nextStepCacheEntry?.value
    }

    func removeValue(for key: Key) {
        nextStepCache.removeObject(forKey: NextStepCacheKey(key))
    }

    // MARK: - Subscript -
    subscript(key: Key) -> Value? {
        get { return value(for: key) }
        set {
            guard let value = newValue else {
                // if nil is assigned using subscript then any value for that key is removed
                removeValue(for: key)
                return
            }
            insert(value, for: key)
        }
    }

    // MARK: - Nested Types -
    private final class NextStepCacheKey: NSObject {
        private let key: Key

        init(_ key: Key) { self.key = key }

        override var hash: Int { return key.hashValue }

        override func isEqual(_ object: Any?) -> Bool {
            guard let nextStepCacheKey = object as? NextStepCacheKey else {
                return false
            }

            return nextStepCacheKey.key == key
        }
    }

    private final class NextStepCacheEntry {
        let value: Value

        init(value: Value) {
            self.value = value
        }
    }
}
