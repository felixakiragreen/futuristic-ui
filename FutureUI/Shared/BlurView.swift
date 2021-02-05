//
//  BlurView.swift
//  FutureUI
//
//  Created by Felix Akira Green on 2/4/21.
//

import SwiftUI

/**
TODO:
- [ ] add a grid view that shows all of the blurs together
- [ ] add a tabView that lets you switch between full Window & grid View
- [ ] pull out the previews
*/

// MARK: - PREVIEW
struct BlurView_Previews: PreviewProvider {
	static var previews: some View {
		BlurView()
			.previewLayout(.sizeThatFits)
	}
//	static var previews: some View {
//		ZStack {
//			LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
//
//			VStack {
//				VisualEffectBlur(material: .contentBackground)
//					.frame(height: 40)
//				//					.padding()
//				VisualEffectBlur(material: .fullScreenUI)
//					.frame(height: 40)
//				//					.padding()
//				VisualEffectBlur(material: .titlebar)
//					.frame(height: 40)
//
//				VisualEffectBlur(material: .headerView)
//					.frame(height: 40)
//
//				VisualEffectBlur(material: .windowBackground)
//					.frame(height: 40)
//
//				VisualEffectBlur(material: .sidebar)
//					.frame(height: 40)
//			}
//			.padding()
//
//			Text("Hello World!")
//		}
//		//		  .frame(width: 200, height: 100)
//		.previewLayout(.sizeThatFits)
//	}
}


/**
# TODO:

- [ ] would be nice to be able to show all of them together in grid
- [ ] split out preview file
*/

struct BlurView: View {
	
	// MARK: - PROPS
	
	let materials: [NSVisualEffectView.Material] = [
		.titlebar,
		.selection,
		.menu,
		.popover,
		.sidebar,
		.headerView,
		.sheet,
		.windowBackground,
		.hudWindow, // ooh
		.fullScreenUI,
		.toolTip,
		.contentBackground,
		.underWindowBackground,
		.underPageBackground
	]
	let materialNames: [String] = [
		".titlebar",
		".selection",
		".menu",
		".popover",
		".sidebar",
		".headerView",
		".sheet",
		".windowBackground",
		".hudWindow",
		".fullScreenUI",
		".toolTip",
		".contentBackground",
		".underWindowBackground",
		".underPageBackground"
	]
	@State var material: Int = 8
	
	let blendModes: [NSVisualEffectView.BlendingMode] = [
		.behindWindow,
		.withinWindow,
	]
	let blendModeNames: [String] = [
		".behindWindow",
		".withinWindow"
	]
	@State var blendMode: Int = 0
	
	let states: [NSVisualEffectView.State] = [
		.followsWindowActiveState,
		.active,
		.inactive
	]
	let stateNames: [String] = [
		".followsWindowActiveState",
		".active",
		".inactive"
	]
	@State var state: Int = 0
	
	// MARK: - BODY
	var body: some View {
		ZStack {
			if let blurMaterial = materials[optional: material],
				let blurBlendMode = blendModes[optional: blendMode],
				let blurState = states[optional: state] {
				
				VisualEffectBlur(material: blurMaterial, blendMode: blurBlendMode, state: blurState)
	
				VStack {
					Text("material: \(materialNames[optional: material] ?? "") - \(blurMaterial.rawValue)")
					Text("blendMode: \(blendModeNames[optional: blendMode] ?? "") - \(blurBlendMode.rawValue)")
					Text("state: \(stateNames[optional: state] ?? "") - \(blurState.rawValue)")
					
					Button("cycle material") {
						if material < materials.count - 1 {
							material += 1
						} else {
							material = 0
						}
					}
					Button("cycle blendMode") {
						if blendMode < blendModes.count - 1 {
							blendMode += 1
						} else {
							blendMode = 0
						}
					}
					Button("cycle state") {
						if state < states.count - 1 {
							state += 1
						} else {
							state = 0
						}
					}
				}
				//: VStack
				.frame(width: 300, height: 300)
			}
		} //: ZStack
	} //: body
}

//struct CyclingBlurView: View {
//
//
//	var body: some View {
//
//	}
//}


//TabView {
//	Text("Content for page 1")
//		.tabItem({ Label("Title 1", systemImage: "1.square.fill") })
//
//	Text("Content for page 2")
//		.tabItem({ Label("Title 2", systemImage: "2.square.fill") })
//
//	Text("Content for page 3")
//		.tabItem({ Label("Title 3", systemImage: "3.square.fill") })
//}
//.frame(width: 300, height: 200)

