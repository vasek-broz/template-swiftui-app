//  View.swift
//  Created by Václav Brož on 30/11/2021

import SwiftUI

extension View {
    func observeNotification(name: Notification.Name,
                             onReceivePerform action: @escaping (Notification) -> Void) -> some View {
        onReceive(NotificationCenter.default.publisher(for: name), perform: action)
    }
}
