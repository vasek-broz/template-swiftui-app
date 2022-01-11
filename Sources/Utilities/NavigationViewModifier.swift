//  NavigationViewModifier.swift
//  Created by Václav Brož on 20/9/2021

import SwiftUI

struct NavigationViewModifier<DestinationView: View>: ViewModifier {
    let isActive: Binding<Bool>
    let destinationView: DestinationView

    func body(content: Content) -> some View {
        content
            .background {
                NavigationLink(isActive: isActive) {
                    destinationView
                } label: {
                    EmptyView()
                }
            }
    }
}

extension View {
    func navigation<Destination: View>(isActive: Binding<Bool>, destination: @escaping () -> Destination) -> some View {
        self.modifier(NavigationViewModifier(isActive: isActive, destinationView: destination()))
    }

    func navigation<Item: Identifiable, Destination: View>(item: Binding<Item?>,
                                                           destination: @escaping (Item) -> Destination) -> some View {
        let isActive = Binding<Bool> {
            item.wrappedValue != nil
        } set: { value in
            if !value {
                item.wrappedValue = nil
            }
        }
        return self.modifier(NavigationViewModifier(isActive: isActive,
                                                    destinationView: destination(item.wrappedValue!)))
    }
}
