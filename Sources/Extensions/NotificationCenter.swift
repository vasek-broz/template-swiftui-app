//  NotificationCenter.swift
//  Created by Václav Brož on 30/11/2021

import Foundation

extension NotificationCenter {
    func post(name: Notification.Name) {
        post(.init(name: name))
    }
}
