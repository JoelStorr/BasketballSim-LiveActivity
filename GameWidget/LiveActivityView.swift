//
//  LiveActivityLockScreenView.swift
//  GameWidgetExtension
//
//  Created by Joel Storr on 24.10.23.
//

import SwiftUI
import WidgetKit

struct LiveActivityView: View {
    var body: some View {
        ZStack{
            Image("activity-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay{
                    ContainerRelativeShape()
                        .fill(.black.opacity(0.3).gradient)
                }
            VStack(spacing: 12){
                HStack{
                    Image("warriors")
                        .teamLogoModifier(frame: 60)
                    Text("125")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Text("125")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.black.opacity(0.8))
                    Image("bulls")
                        .teamLogoModifier(frame: 60)
                    
                }
                HStack{
                    Image("warriors")
                        .teamLogoModifier(frame: 20)
                    Text("S. Curry draines a 3")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white.opacity(0.9))
                }
            }
            .padding()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LiveActivityView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
