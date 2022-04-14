//
//  HomeViewModal.swift
//  Markit
//
//  Created by Zayn on 4/3/22.
//

import SwiftUI
import Foundation
import CoreData

class HomeViewModal: ObservableObject {
	@Published var title = ""
	@Published var isPinned = false
	let manager = CoreDataManager.instance
	@Published var savedIn: [Makeit] = []
	@Published var toBeUpdated: Makeit!
	@Published var addSheet: Bool = false
	@Published var cardColor = ""
	@Published var allColors = ["Red", "Blue", "Yellow", "Pink", "Purple", "Orange", "Brown", "Black"]
	
	init() {
		fetchTodos()
	}
	//Fetch data
	func fetchTodos() {
		let dataRequest = NSFetchRequest<Makeit>(entityName: "Makeit")
		do {
			savedIn = try manager.context.fetch(dataRequest)
		} catch {
			print("error fetching\(error.localizedDescription)")
		}
		
		
	}
	//Add data object
	func addTodo() {
		
		
		
		if toBeUpdated ==  nil {
		let newTodo = Makeit(context: manager.context)
			newTodo.id = UUID()
			newTodo.title = title
			newTodo.isPinned = isPinned
			newTodo.cardColor = cardColor
		//if there is a new info entered then will just save it
		} else {
			toBeUpdated.title = title
			toBeUpdated.isPinned = isPinned
			toBeUpdated.cardColor = cardColor
		}
		//reseting fullscreen
		toBeUpdated = nil
		//
		
		save()
		addSheet.toggle()
		//Save and reset fields
			title = ""
			cardColor = ""
			
		
			
	}
	func updateTodo(todo: Makeit) {

		toBeUpdated = todo
		title = todo.title ?? ""
		cardColor = todo.cardColor ?? ""
		
	 
		save()
	}
	func deleteTodo(todo: Makeit) {
		manager.context.delete(todo)
		save()
	}
	
	//Pin to top
	func pinPill(todo: Makeit) {
		todo.isPinned.toggle()
		save()
	}
	
	//Save into core data
	func save() {
		manager.save()
		fetchTodos()
	}
	
	
	func cardBGColor(cardColor: String) -> Color {
		switch cardColor {
		case "Red":
			return Color.red
		case "Blue":
			return Color.blue
		case "Yellow":
			return Color.yellow
		case "Pink":
			return Color.pink
		case "Purple":
			return Color.purple
		case "Orange":
			return Color.orange
		case "Brown":
			return Color.brown
		case "Black":
			return Color.black
		default:
			return Color.white
		}
		
	}
	
	
}
