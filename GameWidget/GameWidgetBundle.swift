//
//  GameWidgetBundle.swift
//  GameWidget
//
//  Created by Joel Storr on 24.10.23.
//

import WidgetKit
import SwiftUI

@main
struct GameWidgetBundle: WidgetBundle {
    var body: some Widget {
        GameWidget()
        if #available(iOS 16.1, *) {
            GameLiveActivity()
        }
    }
}
