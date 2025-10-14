//
//  URLCacheExtensions.swift
//  swiftui-cached-async-image
//
//  Created by hayakawa.hikaru on 2025/10/14.
//

import Foundation

public extension URLCache {
    static var sharedImageCache: URLCache {
        CachedAsyncImageCache.shared.imageCache
    }
}

private final class CachedAsyncImageCache {
    static let shared = CachedAsyncImageCache()

    private static let memoryStorage = 20 * 1024 * 1024 // 20MB
    private static let diskStorage = 150 * 1024 * 1024 // 150MB
    private static let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
    private static let directoryBasePathComponent = "swiftui-cached-async-image/imagecache"

    let imageCache: URLCache

    private init() {
        let imageCachePath = Self.cacheDirectory?.appendingPathComponent("\(Self.directoryBasePathComponent)")

        self.imageCache = URLCache(memoryCapacity: Self.memoryStorage, diskCapacity: Self.diskStorage, directory: imageCachePath)
    }
}
