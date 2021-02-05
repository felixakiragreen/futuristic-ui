//
//  VisualEffectBlur.swift
//  FutureUI
//
//  Created by Felix Akira Green on 2/5/21.
//

import SwiftUI

/**
TODO:
- [ ] add iOS
*/

#if os(macOS)

struct VisualEffectBlur: View {
	var material: NSVisualEffectView.Material
	var blendMode: NSVisualEffectView.BlendingMode
	var state: NSVisualEffectView.State
	
	init(
		material: NSVisualEffectView.Material = .hudWindow,
		blendMode: NSVisualEffectView.BlendingMode = .behindWindow,
		state: NSVisualEffectView.State = .followsWindowActiveState
	) {
		self.material = material
		self.blendMode = blendMode
		self.state = state
	}
	
	var body: some View {
		Representable(material: material, blendMode: blendMode, state: state)
			.accessibility(hidden: true)
	}
}

// MARK: - Representable

extension VisualEffectBlur {
	struct Representable: NSViewRepresentable {
		var material: NSVisualEffectView.Material
		var blendMode: NSVisualEffectView.BlendingMode
		var state: NSVisualEffectView.State
		
		func makeNSView(context: Context) -> NSVisualEffectView {
			context.coordinator.visualEffectView
		}
		
		func updateNSView(_ view: NSVisualEffectView, context: Context) {
			context.coordinator.update(material: material, blendMode: blendMode, state: state)
		}
		
		func makeCoordinator() -> Coordinator {
			Coordinator()
		}
	}
	
	class Coordinator {
		let visualEffectView = NSVisualEffectView()
		
		init() {}
		
		func update(
			material: NSVisualEffectView.Material,
			blendMode: NSVisualEffectView.BlendingMode,
			state: NSVisualEffectView.State
		) {
			visualEffectView.material = material
			visualEffectView.blendingMode = blendMode
			visualEffectView.state = state
		}
	}
}

#elseif os(iOS)



#endif
