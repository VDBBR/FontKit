//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2025-07-08.
//

import FontKit
import SwiftUI

struct ContentView: View {

    @State var typeSize: DynamicTypeSize = .medium

    var body: some View {
        NavigationStack {
            List {
                Section("Dynamic Size") {
                    ForEach(CustomFont.openDyslexicFonts) {
                        Text($0.name)
                            .font(.dynamic($0, size: 15))
                    }
                }
                Section("Fixed Size") {
                    ForEach(CustomFont.openDyslexicFonts) {
                        Text($0.name)
                            .font(.fixed($0, size: 15))
                    }
                }
                Section("Relative Size") {
                    ForEach(CustomFont.openDyslexicFonts) {
                        Text($0.name)
                            .font(.relative($0, size: 15, relativeTo: .body))
                    }
                }
            }
            .dynamicTypeSize(typeSize)
            .navigationTitle("FontKit")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Picker(
                        "Dynamic Size",
                        selection: $typeSize
                    ) {
                        pickerItem("X Small", .xSmall)
                        pickerItem("Medium", .medium)
                        pickerItem("XXX Large", .xxxLarge)
                    }
                }
            }
        }
    }
}

private extension ContentView {

    func pickerItem(
        _ title: String,
        _ size: DynamicTypeSize
    ) -> some View {
        Text(title).tag(size)
    }
}

#Preview {
    ContentView()
}
