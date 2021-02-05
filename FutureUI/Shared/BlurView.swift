//
//  BlurView.swift
//  FutureUI
//
//  Created by Felix Akira Green on 2/4/21.
//

import SwiftUI



// MARK: - PREVIEW
struct BlurView_Previews: PreviewProvider {
	static var previews: some View {
		BlurView()
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
	
	// MARK: - BODY
	var body: some View {
		let blurMaterialName = materialNames[optional: material]
		
		return ZStack {
			if let blurMaterial = materials[optional: material] {
				VisualEffectBlur(material: blurMaterial)
			}
		VStack {
//		Text("currentMaterial: \(blurMaterialName)")
		}
		.onTapGesture {
			if material < materials.count {
				material += 1
			} else {
				material = 0
			}
//			print("selecting:", materialNames[optional: material])
		}
		.frame(width: 300, height: 300)
		}
	}
}

#if os(macOS)

// MARK: - VisualEffectBlur

/**
TODO:
- [ ] add state
- [ ] add blendMode
https://developer.apple.com/documentation/appkit/nsvisualeffectview
*/

struct VisualEffectBlur: View {
	var material: NSVisualEffectView.Material
	// state
	// blendMode
	
	init(material: NSVisualEffectView.Material = .headerView) {
		self.material = material
	}
	
	var body: some View {
		Representable(material: material)
			.accessibility(hidden: true)
	}
}

// MARK: - Representable

extension VisualEffectBlur {
	struct Representable: NSViewRepresentable {
		var material: NSVisualEffectView.Material
		
		func makeNSView(context: Context) -> NSVisualEffectView {
			context.coordinator.visualEffectView
		}
		
		func updateNSView(_ view: NSVisualEffectView, context: Context) {
			context.coordinator.update(material: material)
		}
		
		func makeCoordinator() -> Coordinator {
			Coordinator()
		}
	}
	
	class Coordinator {
		let visualEffectView = NSVisualEffectView()
		
		init() {
			visualEffectView.blendingMode = .withinWindow
			visualEffectView.state = .active
		}
		
		func update(material: NSVisualEffectView.Material) {
			visualEffectView.material = material
		}
	}
}


#elseif os(iOS)



#endif
