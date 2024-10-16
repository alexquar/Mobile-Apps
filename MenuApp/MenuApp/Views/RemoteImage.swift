//
//  RemoteImage.swift
//  MenuApp
//
//  Created by Alex on 2024-10-13.
//

import Foundation
import SwiftUI

final class ImageLoader : ObservableObject{
    //our published image that can be nil
    @Published var image: Image? = nil
    
    
    public func load (url:String){
        //downloads image using our network manager and sets it to uiImage which could be nil
        NetworkManager.shared.downloadImage(URLString: url){ uiImage in
            guard let uiImage = uiImage else {return}
            //no idea what this is
            DispatchQueue.main.async{
                //convert uiimage to a swift Image
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage : View {
    var image:Image?
    var body:some View {
        //return our image and if we dont have render the placeholder
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    //state object of our image loader
    @StateObject var imageLoader = ImageLoader()
    //url for needed image that must be passed in
    let url:String
    var body: some View {
        //will be nil at first
        RemoteImage(image: imageLoader.image)
        //will appear and trigger this to get actual image
            .onAppear{
                imageLoader.load(url: url)
            }
    }
}
