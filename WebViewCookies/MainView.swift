//
//  MainView.swift
//  WebViewCookies
//
//  Created by Ahmed Refat on 10/03/2025.
//

import SwiftUI
import WebKit

struct MainView: View {
    
    let webview = WebView(web: nil, req: URLRequest(url:URL(              string:"https://staging.d33sizdmtypegn.amplifyapp.com/login")!))
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                RoundedRectangle(cornerSize: CGSize(width: 4.2, height: 4.2))
                    .frame(width: 150,height: 70)
                    .foregroundColor(.white)
                ProgressView("Loading...")
            }
            webview
            
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width:55, height: 130)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                VStack(spacing: 7){
                    Button(action: {
                        self.webview.goHome()
                    }){
                        Image(systemName: "house.fill")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Divider()
                        .foregroundColor(.black)
                        .frame(width: 35)
                    Spacer()
                    Button(action: {
                        self.webview.reload()
                    }){
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.gray)
                    }
                }.frame(height: 55)
            }.draggable()
                .offset(x:125,
                        y:300)
        }
    }
}

struct DraggableView: ViewModifier {
    @State var offset = CGPoint(x: 0, y: 0)
    
    func body(content: Content) -> some View {
        content
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { value in
                    self.offset.x += value.location.x - value.startLocation.x
                    self.offset.y += value.location.y - value.startLocation.y
                })
            .offset(x: offset.x, y: offset.y)
    }
}

extension View {
    func draggable() -> some View {
        return modifier(DraggableView())
    }
}

#Preview {
    MainView()
}
