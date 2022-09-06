//
//  ContentView.swift
//  Instafilter
//
//  Created by Tony Vu on 11/17/21.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    @State private var showingFilterSheet = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    // Challenge #1
    @State private var showingSaveAlert = false
    @State private var alertTitle = ""
    
    // Challenge #2
    @State private var filterName = "Change filter"
    
    // Challenge #3
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5

    var body: some View {
        let intensity = Binding<Double>(
            get: {
                self.filterIntensity
            }, set: {
                self.filterIntensity = $0
                self.applyProcessing()
            }
        )
        
        let radius = Binding<Double>(
            get: {
                self.filterRadius
            }, set: {
                self.filterRadius = $0
                self.applyProcessing()
            }
        )
        
        let scale = Binding<Double>(
            get: {
                self.filterScale
            }, set: {
                self.filterScale = $0
                self.applyProcessing()
            }
        )
        
        return NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                VStack(spacing: 0) {
                    HStack {
                        Text("Intensity")
                            .frame(width: 80)
                        Slider(value: intensity)
                            .accentColor(currentFilter.inputKeys.contains(kCIInputIntensityKey) ? .blue : .secondary)
                            .disabled(!currentFilter.inputKeys.contains(kCIInputIntensityKey))
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Radius")
                            .frame(width: 80)
                        Slider(value: radius)
                            .accentColor(currentFilter.inputKeys.contains(kCIInputRadiusKey) ? .purple : .secondary)
                            .disabled(!currentFilter.inputKeys.contains(kCIInputRadiusKey))
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Scale")
                            .frame(width: 80)
                        Slider(value: scale)
                            .accentColor(currentFilter.inputKeys.contains(kCIInputScaleKey) ? .pink : .secondary)
                            .disabled(!currentFilter.inputKeys.contains(kCIInputScaleKey))
                    }
                    .padding(.vertical)
                }
                
                HStack {
                    Button(withAnimation { filterName }) {
                        self.showingFilterSheet = true
                    }
                    .foregroundColor(.white)
                    .padding(10)
                    .background(.blue)
                    .clipShape(Capsule())
                    
                    Spacer()
                    
                    Button("Save") {
                        if let savingImage = processedImage {
                            let imageSaver = ImageSaver()
                            
                            imageSaver.successHandler = {
                                print("Success!")
                            }
                            
                            imageSaver.errorHandler = {
                                print("Oops: \($0.localizedDescription)")
                            }
                            
                            imageSaver.writeToPhotoAlbum(image: savingImage)
                            
                        } else {
                            showingSaveAlert = true
                            alertTitle = "Please select an image."
                        }
                    }
                    .foregroundColor(.white)
                    .padding(10)
                    .background(.blue)
                    .clipShape(Capsule())
                }
            }
            .padding([.horizontal, .bottom])
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet, titleVisibility: .visible) {
                Button("Crystallize") {
                    self.setFilter(CIFilter.crystallize(), setName: "Crystallize")
                }
                
                Button("Edges") {
                    self.setFilter(CIFilter.edges(), setName: "Edges")
                }
                
                Button("Blur") {
                    self.setFilter(CIFilter.gaussianBlur(), setName: "Blur")
                }
                
                Button("Pixellate") {
                    self.setFilter(CIFilter.pixellate(), setName: "Pixellate")
                }
                
                Button("Sepia Tone") {
                    self.setFilter(CIFilter.sepiaTone(), setName: "Sepia Tone")
                }
                
                Button("Unsharp Mask") {
                    self.setFilter(CIFilter.unsharpMask(), setName: "Unsharp Mask")
                }
                
                Button("Vignette") {
                    self.setFilter(CIFilter.vignette(), setName: "Vignette")
                }
                
                Button("Cancel", role: .cancel) { }
            }
            .alert(alertTitle, isPresented: $showingSaveAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .navigationTitle("Instafilter")
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(200 * filterRadius, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(10 * filterScale, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter, setName name: String ) {
        currentFilter = filter
        withAnimation {
            filterName = name
        }
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
