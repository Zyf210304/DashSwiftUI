//
//  ContentView.swift
//  Dash
//
//  Created by 亚飞 on 2021/1/28.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            Home()
                .preferredColorScheme(.dark)
                .navigationTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var index = 0
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State var videos = [
    
        AVPlayer(url: URL(string: "https://upos-sz-mirrorhw.bilivideo.com/upgcxcode/44/89/247518944/247518944-1-16.mp4?e=ig8euxZM2rNcNbdlhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&uipk=5&nbs=1&deadline=1611809633&gen=playurl&os=hwbv&oi=794615563&trid=25122c81e06f45d59d4494b367f6bd83h&platform=html5&upsig=2710c83692b0ac5aa40f63cf0a46de28&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,platform&mid=0&logo=80000000")!),
        AVPlayer(url: URL(string: "https://upos-sz-mirrorcos.bilivideo.com/upgcxcode/11/61/276196111/276196111-1-16.mp4?e=ig8euxZM2rNcNbdlhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&uipk=5&nbs=1&deadline=1611810553&gen=playurl&os=cosbv&oi=794615563&trid=1abe69c92acd48afb577736aadf8c980h&platform=html5&upsig=3841d1eb4af64220f0a0bf5b0e0f285f&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,platform&mid=0&logo=80000000")!),
        AVPlayer(url: URL(string: "https://upos-sz-mirrorkodo.bilivideo.com/upgcxcode/88/84/257558488/257558488-1-16.mp4?e=ig8euxZM2rNcNbdlhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&uipk=5&nbs=1&deadline=1611810616&gen=playurl&os=kodobv&oi=794615563&trid=a9da6c2e7347444196f6de5de3158334h&platform=html5&upsig=fffbb592052fc1d4be07763260529ec9&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,platform&mid=0&logo=80000000")!),
        AVPlayer(url: URL(string: "https://upos-sz-mirrorhw.bilivideo.com/upgcxcode/44/89/247518944/247518944-1-16.mp4?e=ig8euxZM2rNcNbdlhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&uipk=5&nbs=1&deadline=1611809633&gen=playurl&os=hwbv&oi=794615563&trid=25122c81e06f45d59d4494b367f6bd83h&platform=html5&upsig=2710c83692b0ac5aa40f63cf0a46de28&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,platform&mid=0&logo=80000000")!)
    ]
    
    var body: some View {
        
        
        TabView (selection: $index) {
            
            ForEach(0..<videos.count, id: \.self) { i in
                
                Player(video: $videos[i])
                .padding()
                .rotationEffect(.init(degrees: -90))
                .frame(width: UIScreen.main.bounds.width)
                .tag(i)
            }
            .onChange(of: index, perform: { _ in
                
                for i in  0..<videos.count {
                    
                    videos[i].pause()
                }
                
                videos[index].play()
            })
        }
        .rotationEffect(.init(degrees: 90))
        .frame(width: UIScreen.main.bounds.height - (edges!.top + edges!.bottom))
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color.black.ignoresSafeArea())
    }
}

struct Player : View {
    
    @Binding var video : AVPlayer
    
    var body: some View {
        
        VideoPlayer(player: video)
    }
    
}
