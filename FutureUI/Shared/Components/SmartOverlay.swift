//
//  SmartOverlay.swift
//  JunkDrawer
//
//  Created by Felix Akira Green on 1/27/21.
//

import SwiftUI

// MARK: - PREVIEW
struct SmartOverlay_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			Text("HEEYYYY")
			SmartOverlay(
				viewSize: CGSize(width: 500, height: 500),
				elementSize: CGSize(width: 50, height: 50),
				offset: CGSize(width: 100, height: 100)
			) { _, _ in
				VStack {
					Text("HEEYYYY")
				}
				.foregroundColor(ColorPreset(lum: .dark).getColor())
				.padding()
				.background(ColorPreset(lum: .dark).getColor().opacity(0.5))
			}
		}
		.frame(width: 500, height: 500)
	}
}

/**
This is an overlay that expands in the direction of wherever it has space to.
*/

struct SmartOverlay<Content: View>: View {
	// MARK: - PROPS
	typealias ContentFunction = (_ hAlignment: HorizontalAlignment, _ vAlignment: VerticalAlignment) -> Content
	let content: ContentFunction
	
	let viewSize: CGSize
	let elementSize: CGSize
	let offset: CGSize
	
	init(viewSize: CGSize, elementSize: CGSize, offset: CGSize, @ViewBuilder _ content: @escaping ContentFunction) {
		self.content = content
		self.viewSize = viewSize
		self.elementSize = elementSize
		self.offset = offset
	}
	
	// MARK: - BODY
	var body: some View {
		let hSide: HorizontalAlignment = offset.width < (viewSize.width / 2) ? .leading : .trailing
		let vSide: VerticalAlignment = offset.height < (viewSize.height / 2) ? .top : .bottom
		
		let width = hSide == .leading ? viewSize.width - offset.width - elementSize.width : offset.width
		let height = vSide == .top ? viewSize.height - offset.height - elementSize.height : offset.height
		let offsetX = hSide == .leading ? offset.width + elementSize.width : 0
		let offsetY = vSide == .top ? offset.height + elementSize.height : 0
		
		return ZStack(alignment: Alignment(horizontal: hSide, vertical: vSide)) {
			Color.clear
			content(hSide, vSide)
		}
		.frame(width: width, height: height)
		.offset(x: offsetX, y: offsetY)
	}
}
