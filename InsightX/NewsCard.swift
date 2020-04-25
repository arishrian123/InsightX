//
//  CourseList.swift
//  DesignCode
//
//  Created by Meng To on 2020-01-07.
//  Copyright © 2020 Meng To. All rights reserved.
//

import SwiftUI

struct NewsCard: View {
    @ObservedObject var newsData = NewsData
    @State var show = false
    @State var active = false
    @State var activeIndex = -1
    @State var activeView = CGSize.zero
    
    var body: some View {
        ZStack {
            Color.black.opacity(Double(self.activeView.height/500))
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("News")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(newsData.NewsData.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            NewsCardView(
                                show: self.$show,
                                news: self.newsData.NewsData[index],
                                active: self.$active,
                                index: index,
                                activeIndex: self.$activeIndex,
                                activeView: self.$activeView
                            )
                                .offset(y: self.show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                            
                        }
                        .frame(height: 280)
                        .frame(maxWidth: self.show ? .infinity : screen.width - 60)
                        .zIndex(self.show ? 1 : 0)
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .statusBar(hidden: active ? true : false)
            .animation(.linear)
        }
    }
}

struct NewsCard_Previews: PreviewProvider {
    static var previews: some View {
        NewsCard()
    }
}

struct NewsCardView: View {
    @Binding var show: Bool
    var news: articles
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    let color = [
     Color("card1"),
     Color("card2"),
     Color("card3"),
     Color("card4"),
     Color("card5")
    ]
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            
            VStack(alignment: .leading, spacing: 30.0) {
                
                    
                    Text(news.title)
                    
                    Text("About this news")
                        .font(.title).bold()
                    
                    Text(news.content).font(.subheadline)
                    
                    
                
                }
                .padding(30)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
                .offset(y: show ? 460 : 0)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .opacity(show ? 1 : 0)
            
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(news.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text(news.title)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
//                        Image(uiImage: #imageLiteral(resourceName: "Background1"))
//                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 36, alignment: .top)
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
            
            .background(color.randomElement())
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                
            .gesture(
                show ?
                DragGesture().onChanged { value in
                    guard value.translation.height < 300 else { return }
                    guard value.translation.height > 0 else { return }
                    
                    self.activeView = value.translation
                }
                .onEnded { value in
                    if self.activeView.height > 50 {
                        self.show = false
                        self.active = false
                        self.activeIndex = -1
                    }
                    self.activeView = .zero
                }
                : nil
            )
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                if self.show {
                    self.activeIndex = self.index
                } else {
                    self.activeIndex = -1
                }
            }
        }
        .frame(height: show ? screen.height : 280)
    
        .scaleEffect(1 - self.activeView.height / 1000)
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height / 10)), axis: (x: 0, y: 10.0, z: 0))
        .hueRotation(Angle(degrees: Double(self.activeView.height)))
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .gesture(
            show ?
            DragGesture().onChanged { value in
                guard value.translation.height < 300 else { return }
                guard value.translation.height > 0 else { return }
                
                self.activeView = value.translation
            }
            .onEnded { value in
                if self.activeView.height > 50 {
                    self.show = false
                    self.active = false
                    self.activeIndex = -1
                }
                self.activeView = .zero
            }
            : nil
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: UIImage
    var logo: UIImage
    var color: UIColor
    var show: Bool
}

var courseData = [
    Course(title: "Prototype Designs in SwiftUI", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Background1"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), show: false),
    Course(title: "SwiftUI Advanced", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card3"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
    Course(title: "UI Design for Developers", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card4"), logo: #imageLiteral(resourceName: "Logo3"), color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), show: false)
]
