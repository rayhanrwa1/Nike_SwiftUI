//
//  HomeScreen.swift
//  Nike_app
//
//  Created by Han on 8/11/23.
//

import SwiftUI

struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    
    /**
     Katagori dan Search
     */
    private let categories = ["All", "Nike Air MAX", "Nike Air Force", "Nike Jordan", "Nike Air Huarache", "Nike Blazzer"]
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView(search: $search)
                        
        /**
        Akhir Katagori dan Search
        */
                        
            /**
            Katalog
            */
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                Button(action: {selectedIndex = 0}) {
                                    CategoryView(isActive: selectedIndex == 0, text: categories[0])
                                }
                                Button(action: {selectedIndex = 1}) {
                                    CategoryView(isActive: selectedIndex == 1, text: categories[1])
                                }
                                Button(action: {selectedIndex = 2}) {
                                    CategoryView(isActive: selectedIndex == 2, text: categories[2])
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                    NavigationLink(
                                        destination: DetailScreen(),
                                        label: {
                                            ProductCardView(image: Image("NikeAirMax90"), size: 210)
                                        })
                                    NavigationLink(
                                    destination: DetailScreen2(),
                                    label: {
                                        ProductCardView2(image: Image("NikeAirMaxScorpion"), size: 210)
                                    })
                                    NavigationLink(
                                        destination: DetailScreen3(),
                                        label: {
                                    ProductCardView3(image: Image("Nike Air Max Alpha"), size: 210)
                                    })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                NavigationLink(
                                destination: DetailScreen4(),
                                label: {
                                    ProductBestView(image: Image("Nike Air Max 97"), size: 210)
                                })
                                NavigationLink(
                                destination: DetailScreen5(),
                                label: {
                                    ProductBestView2(image: Image("Nike Air Max 1 '86 OG G"), size: 210)
                                })
                                NavigationLink(
                                destination: DetailScreen6(),
                                label: {
                                    ProductBestView3(image: Image("Nike Air Max Pulse"), size: 210)
                                })
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
            
                        
                    }
                }
                
                VStack {
                    Spacer()
                    BottomNavBarView()
                }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


/**
 Bar / Navigasi
 */
struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("Bar")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(uiImage: #imageLiteral(resourceName: "Fotoaq"))
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

/**
 Akhir Bar / Navigasi
 */

/**
 Tagline
 */
struct TagLineView: View {
    var body: some View {
        Text("Nike, Just\nDo")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
            + Text(" It.!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}

/**
 Akhir Tagline
 */

/**
 Search dan Scan
 */
struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image("Barcode")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

/**
 Akhir Search dan Scan
 */

/**
 Kategori Baris / View
 */
struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            if (isActive) { Color("Primary")
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

/**
 Akhir Kategori View
 */


    /**
     Product Card View :)
     */

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Nike Air Max").font(.title3).fontWeight(.bold)
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$250")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}

struct ProductCardView2: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Nike Air Max Scorpion").font(.title3).fontWeight(.bold)
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$350")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}
struct ProductCardView3: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Nike Air Max Alpha").font(.title3).fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$115")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}

/**
 Akhir Product Card View
 */

/**
 Product Best View :)
 */
struct ProductBestView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Nike Air Max 97").font(.title3).fontWeight(.bold)
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$550")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}
struct ProductBestView2: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Nike Air Max 1 '86").font(.title3).fontWeight(.bold)
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$200")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}
struct ProductBestView3: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Nike Air Max Pulse").font(.title3).fontWeight(.bold)
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$450")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}
/**
 Akhir ProductBestView
 */



struct BottomNavBarView: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image("Home"), action: {})
            BottomNavBarItem(image: Image("Fav"), action: {})
            BottomNavBarItem(image: Image("Shop"), action: {})
            BottomNavBarItem(image: Image("User"), action: {})
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}
