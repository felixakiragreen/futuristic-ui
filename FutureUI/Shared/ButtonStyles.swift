//
//  ButtonStyles.swift
//  FutureUI
//
//  Created by Felix Akira Green on 1/27/21.
//

import SwiftUI

struct ButtonStyles: View {
	var body: some View {
		VStack {
			Button(action: {
				print("save button")
			}, label: {
				Text("save")
					.font(.system(.largeTitle, design: .monospaced))
					.fontWeight(.black)
					.padding()
			})
				.buttonStyle(BrutalistButtonStyle(hue: .green))
		}
	}
}

struct ButtonStyles_Previews: PreviewProvider {
	static var previews: some View {
		ButtonStyles()
	}
}

struct BrutalistButtonStyle: ButtonStyle {
	var hue: ColorHue = .grey
	var dis: CGFloat = 3.0

	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.padding(dis * 2)
			.offset(x: configuration.isPressed ? dis : -dis, y: configuration.isPressed ? dis : -dis)
			.background(
				ZStack {
					// shadow
					Rectangle()
						.fill(ColorPreset(hue: hue, lum: .extraLight).getColor())
						.offset(x: dis, y: dis)

					// ground
					Rectangle()
						.foregroundColor(ColorPreset(hue: hue, lum: configuration.isPressed ? .light : .normal).getColor())
						.offset(x: configuration.isPressed ? dis : -dis, y: configuration.isPressed ? dis : -dis)

					// border
					Rectangle()
						.inset(by: -dis)
						.strokeBorder(ColorPreset(hue: hue, lum: configuration.isPressed ? .normal : .light).getColor(), lineWidth: 2)
						.offset(x: configuration.isPressed ? dis : -dis, y: configuration.isPressed ? dis : -dis)
				}
			)
			.foregroundColor(ColorPreset(hue: hue, lum: .dark).getColor())
			.animation(.spring(response: 0))
	}
}
