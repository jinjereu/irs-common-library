//
//  ColorExtensions.swift
//  IRSCommonLibrary
//
//  Created by Ingrid Silapan on 15/11/18.
//

import Foundation

extension UIColor {
	
	public class func colorWithHex(_ hex: String) -> UIColor {
		var rgbValue: UInt32 = 0
		let scanner = Scanner(string: hex)
		scanner.scanLocation = 0
		scanner.scanHexInt32(&rgbValue)
		let red = (CGFloat)((rgbValue & 0xff0000) >> 16) / 255.0
		let green = (CGFloat)((rgbValue & 0x00ff00) >> 8) / 255.0
		let blue = (CGFloat)(rgbValue & 0x0000ff) / 255.0
		return UIColor(red: red, green: green, blue: blue, alpha: 1)
	}
	
	public func brighten(_ percent: CGFloat) -> UIColor {
		var hue: CGFloat = 0
		var saturation: CGFloat = 0
		var brightness: CGFloat = 0
		var alpha: CGFloat = 0
		self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
		brightness = min(100, brightness + brightness*(percent/100))
		return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
	}
	
	public func darken(_ percent: CGFloat) -> UIColor {
		var hue: CGFloat = 0
		var saturation: CGFloat = 0
		var brightness: CGFloat = 0
		var alpha: CGFloat = 0
		self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
		brightness = max(0, brightness*(1-(percent/100)))
		return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
	}
	
	public func saturate(_ percent: CGFloat) -> UIColor {
		var hue: CGFloat = 0
		var saturation: CGFloat = 0
		var brightness: CGFloat = 0
		var alpha: CGFloat = 0
		self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
		saturation = min(100, saturation + saturation*(percent/100))
		return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
	}
	
	public func interpolate(_ color: UIColor, factor: CGFloat) -> UIColor {
		
		let fraction = max(0.0, min(factor, 1.0))
		
		let startComponent = self.cgColor.components;
		let endComponent = color.cgColor.components;
		
		let startAlpha = self.cgColor.alpha;
		let endAlpha = color.cgColor.alpha;
		
		let r = (startComponent?[0])! + ((endComponent?[0])! - (startComponent?[0])!) * fraction;
		let g = (startComponent?[1])! + ((endComponent?[1])! - (startComponent?[1])!) * fraction;
		let b = (startComponent?[2])! + ((endComponent?[2])! - (startComponent?[2])!) * fraction;
		let a = startAlpha + (endAlpha - startAlpha) * fraction;
		
		return UIColor(red: r, green: g, blue: b, alpha: a)
	}
	
}
