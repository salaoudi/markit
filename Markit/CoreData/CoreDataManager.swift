//
//  CoreDataManager.swift
//  Markit
//
//  Created by Zayn on 4/3/22.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
	
	static let instance = CoreDataManager()
	let container: NSPersistentContainer
	let context: NSManagedObjectContext
	
	
	init() {
		container = NSPersistentContainer(name: "Markit")
		container.loadPersistentStores { (core, error) in
			if let error = error {
				print("error\(error.localizedDescription)")
			}
		}
		context = container.viewContext
   
	}
	
	
	//Save to core data
 func save() {
	 do {
		 try container.viewContext.save()
	 } catch {
		 print("ERROR SAVE FUNCTION / COREDATA MANAGER")
	 }
 }
	
}
